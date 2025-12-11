using DelaunayTriangulation
using CairoMakie
using Memoization
using JLD2

#this is where I put all my fancy helper functions.
JLD2.@load joinpath(dirname(@__DIR__),"intermediate_results","cell_dataframe.jld2") cell_dataframe

@memoize function get_vorn(patient)
    df = cell_dataframe[cell_dataframe.Patient .== patient,:]
    points = collect((zip(df.centroid_row,df.centroid_col)))
    tri = triangulate(points)
    vorn = voronoi(tri)
    return vorn
end
