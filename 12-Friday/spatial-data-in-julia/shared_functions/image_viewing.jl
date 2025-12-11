using ImageCore
using ImageIO
using TiffImages
using Memoization
using DataFrames
import Statistics: quantile
import Luxor: Luxor, gsave, grestore, @svg
	using Base64
	using FileIO


FIG_PATH = joinpath(dirname(@__DIR__),"plots","images")

DATA_PATH = joinpath(dirname(@__DIR__),"data")

"""
private struct wrapper for changing display protocol
""" 
struct FullImage{C<:Colorant}
    img::AbstractMatrix{C}
end
function Base.show(io::IO, mime::MIME"image/png",  fi::FullImage)
     FileIO.save(FileIO.Stream{format"PNG"}(io), fi.img)
end

"""
complicated function with the sole purporse of drawing the color wheel using luxor
"""
function draw_scale(hue,saturation; nh = 360, ns = 100)
    maxr = saturation + (1 / ns / 2 + .01)
    minr = saturation - (1 / ns / 2)
    maxθ = 2*pi*(hue/360 + (1 / nh / 2) + .001)
    minθ = 2*pi*(hue/360 - (1 / nh / 2))
    hsv = RGB(HSV(360-hue,saturation,1))
    Luxor.sethue(red(hsv),green(hsv),blue(hsv))
    Luxor.setline(0.1)
    Luxor.arc(Luxor.Point(0,0), maxr,minθ,maxθ)
    Luxor.carc(Luxor.Point(0,0), minr,maxθ,minθ)
    Luxor.fillstroke()
end


function color_wheel(H,S; path = joinpath(FIG_PATH, ".tmp_colorwheel"))
@svg begin
        Luxor.setline(10)
        Luxor.sethue("purple")
        Luxor.scale(.9)
        gsave()
        Luxor.scale(100)
        for ii in 1:60
            for jj in range(0,1,20)
                draw_scale(ii*6,jj;nh = 60,ns = 20)
            end
        end
        grestore()
        gsave()
        Luxor.sethue("black")
        Luxor.setline(1.0)
        #for ii in 0:10:350
        #    θ = -(ii/360)*2*pi
        #    line(Point(100*cos(θ), 100*sin(θ)),Point(105*cos(θ), 105*sin(θ)); action = :stroke)
        #    text(string(ii), Point(110*cos(θ), 110*sin(θ)), angle=θ, valign = :middle)
        #end
        grestore()
        Luxor.sethue("black")
        Luxor.setline(3)
        Luxor.circle(Luxor.Point(S*100*cospi(H/180), -S*100*sinpi(H/180)),4, action = :stroke)
end 200 200 path

end

getimage_tiff(name) = channelview(TiffImages.load(joinpath(DATA_PATH,"img",name*".tiff"), verbose = false))

getmask_tiff(name) = Matrix{Int}(rawview(channelview(TiffImages.load(joinpath(DATA_PATH,"masks",name*".tiff"), verbose = false))))

"""
loads an image by name and returns the colorized version
"""
function color_img(name, color_scheme; kwds...)
	arr = quantile_scale(getimage_tiff(name); name)
	colorize(arr, color_scheme; kwds...)
end

"""
Generates the color images using the loaded images and color collection
"""
function colorize(tiff_array, color_scheme; 
	panel_df = panel_df, value_scale = 1)
	idx, clrs = convert_to_sparse(color_scheme, panel_df)
	img = fill(RGB(0), size(tiff_array,2), size(tiff_array,3)) # allocate an array of RGB
	for I in CartesianIndices(img)
		pixel = RGB(0)
		for (i,c) in zip(idx, clrs)
			pixel += tiff_array[i,I] * c * value_scale # for each color c, add it to the pixel
		end
		img[I] = RGB{Float64}(clamp(pixel.r,0.0,1.0), clamp(pixel.g,0.0,1.0), clamp(pixel.b,0.0,1.0)) # clamp dynamic range
	end
	return img
end

"""
helper function to convert the keys into an indexing scheme for fast colorizing
"""
function convert_to_sparse(color_scheme, panel_df)
	targets = keys(color_scheme)
	idx = Int[findfirst( ==(t), panel_df.name) for t in targets]
	colors = RGB{Float64}[RGB{Float64}(color_scheme[t]) for t in targets]
	return (idx,colors)
 end


 """
input 'data' is an array [x,y,channel]
returns quantile scaled between 0 and 1 with [channel, x,y]
reference_quantile is a parameter for the normalization method
"""
function quantile_scale(data; reference_quantile = 0.95, name = nothing)
	out = similar(data)
	nan_remove(x) = isinf(x) ? (reference_quantile*255) : 
		clamp(Float64(x), 0.5, 255)
	vec_scales::Vector{Float64} = image_channel_scales(name; reference_quantile = 0.95)
	for k in axes(data,3)
		#scale_factor = (reference_quantile) /
		#	nan_remove(quantile(vec(view(data, :, :, k)), reference_quantile))
		scale_factor = vec_scales[k]  # min(scale_factor,1)
		for j in axes(data,2)
			for i in axes(data,1)		
				out[i,j,k] = clamp( scale_factor * data[i, j, k], 0, 1)
			end
		end
	end
	return permutedims(out,(3,1,2))
end

@memoize function image_channel_scales(name; reference_quantile = 0.95)
	nan_remove(x) = isinf(x) ? (reference_quantile*255) : 
		clamp(Float64(x), 0.5, 255)
	data = getimage_tiff(name)
	return [min(
		(reference_quantile) /
			nan_remove(quantile(vec(view(data, :, :, k)), reference_quantile)),0.2) for k in axes(data,3)]
end

function full_color_img(selected_patient, cc; kwds...)
    img = color_img(selected_patient, cc; kwds...)
    FullImage(img)
end


function mask_averages(image_array, mask_array; col_names = [Symbol("channel_$i") for i in 1:size(image_array, 3)])
    labels = sort!(unique(mask_array))
    filter!(!iszero, labels)
    label_map = Dict(l => i for (i, l) in enumerate(labels))
    n_labels = length(labels)
    n_channels = size(image_array, 3)

    # Accumulators
    channel_sums = zeros(Float64, n_labels, n_channels)
    row_sums     = zeros(Int64, n_labels)
    col_sums     = zeros(Int64, n_labels)
    counts       = zeros(Int64, n_labels)

    # Loop over channels
    for c in 1:n_channels
        # Extract the current channel slice
        img_slice = @view image_array[:, :, c]
        
        # On the FIRST channel (c==1), we also calculate centroids
        if c == 1
            # zip Mask, Image, AND Coordinates together
            for (idx, label, px) in zip(CartesianIndices(mask_array), mask_array, img_slice)
                if label != 0
                    i = label_map[label]
                    channel_sums[i, c] += px
                    
                    # Centroid logic (only done once)
                    row_sums[i] += idx[1]
                    col_sums[i] += idx[2]
                    counts[i]   += 1
                end
            end
        else
            # Subsequent channels: just calculate density
            for (label, px) in zip(mask_array, img_slice)
                if label != 0
                    i = label_map[label]
                    channel_sums[i, c] += px
                end
            end
        end
    end

    # Finalize DataFrame
    df = DataFrame(
        mask_index = labels,
        area = counts,
        centroid_row = row_sums ./ counts,
        centroid_col = col_sums ./ counts
    )
    
    # Add density columns
    for (name, c) in zip(col_names, axes(channel_sums,2))
        df[!, Symbol(name)] = channel_sums[:, c] ./ counts
    end

    return df
end