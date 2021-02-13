library(tidyverse)

# Code from https://github.com/klemensj/Serengeti-Apps/tree/master/Serengeti_activity_time
# DATA 
# Read in data 
Serengeti <-read.csv("../../Full_Serengeti_Data.csv")

# Generate  species lists
speciesList <- as.list(Serengeti %>% distinct(Species))
speciesList<- sort(speciesList$Species)
commonGrazerList <- as.list(c("buffalo","eland","elephant","gazelleGrants", "gazelleThomsons","giraffe","hartebeest","hippopotamus","impala", "reedbuck", "rhinoceros", "topi", "warthog", "wildebeest","zebra"))
predList <- as.list(c("batEaredFox","jackal","hyenaSpotted","hyenaStriped","wildcat","serval","cheetah","leopard","lionMale","lionFemale"))

# Select cam specific data from and filter to 1 row per camera, discard observation data
camData_distinct <- Serengeti %>% distinct(Camera.Site, .keep_all = TRUE)     
camData <- select(camData_distinct, Camera.Site:Camera.Mount)
#===============================================================================

