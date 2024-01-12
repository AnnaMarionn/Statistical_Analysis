          ## importing the dataset
getwd()   ##to get the working directory currently used (Project folder)

          ## To set working directory:
          ## setwd("C://Users/annam/Desktop/unibo/stat/Statistics_R_project")

library(readr)

SolarDataset <- read_csv("/Users/annam/Desktop/unibo/stat/Statistics_R_project/DatasetFinale.csv")


#remove the first and the last column because we interested into this information
studdf <- as.data.frame(StudDataset[ , -c(1, ncol(StudDataset))])
head(studdf)
