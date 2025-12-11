# Spatial Data In Julia!
Spatial biology is rapidly evolving, no one is really sure what the best approach or standard analysis will look like. With a fun and fast programming language like Julia, you can test out new solutions and approaches quickly in a reactive and reproducible notebook environment. Images are just big matrices, cell data just a big data frame. Why not wrangle them with a nicely designed language that makes vectorizing functions as easy as ".", and arrays are as easy as [1,2,3]?
## Instructors
Colin LaMont

## Data Download
In the repository for the course download the hyperion data here. 

https://figshare.com/s/e76c4ea940c55cd65093

make sure the data folder is nestled in the main folder with this readme, and that it contains img (the images) and masks and panel.csv


## Software Requirements

### Julia
install julia using juliaup at
https://julialang.org/downloads/

### Pluto
install pluto by typing into the terminal 
`julia`
this will open the julia repl
`] add Pluto`
this will use the package manager and download Pluto after it finishes hit backspace to go back to the julia repl and type
`using Pluto`

Pluto.run()

### Packages

If you open the notebooks of the course the Pluto package manage will start up and the packages will download and compile, as this can take a few minutes, be sure to try and open them sooner than later.
