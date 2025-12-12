library(readr)
library(mlbench)

#This file must be executed in the root directory 
#setwd("/your/path/OBiWoW-2025/12-Friday/from-tidy-data-to-tidy-models-modeling-sensitive-health-data-in-r")

#Module 1 and 2
dat<-read_csv(file="data/sample.csv",col_names=TRUE)

#Module 2 Challenge
idf<-read_csv(file="data/inflammation-01.csv",col_names=FALSE)

#Module 3
#load data from the mlbench package
pima<-data("PimaIndiansDiabetes")

#Activity 1-3
#diabetes
dia<-read_xpt("data/DIQ_L.xpt")

#physical activity
pa<-read_xpt("data/PAQ_L.xpt")

#weight
wei<-read_xpt("data/WHQ_L.xpt")

# Save specific data frames (e.g., df1 and df2) into one file
save(dat,idf,pima,dia,pa,wei, file = "workshop_data.RData")
