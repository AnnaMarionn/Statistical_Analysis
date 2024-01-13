          ## importing the dataset
getwd()   ##to get the working directory currently used (Project folder)
          ## for me: "C:/Users/annam/Desktop/unibo/stat/Statistics_R_project"
          ## To set working directory:
          ## setwd("C://Users/annam/Desktop/unibo/stat/Statistics_R_project")

library(readr)
          ##la funzione read_csv è specifica del pacchetto readr, assume che la prima riga sia un'intestazione

SolarDataset <- read_csv("/Users/annam/Desktop/unibo/stat/Statistics_R_project/DatasetFinale.csv")
          ##to check:
spec(SolarDataset)
          ## problem: R reads it as 1 column, 196776 rows--> wrong!
          ##ChatGPT suggests:
SolarDataset <- read.csv("DatasetFinale.csv", sep=";")
          ##It works! problem: the function is different (read_csv became read.csv) and the function used 
          ## to check (spec) doesn't work anymore:
spec(SolarDataset)
# "Errore in spec(SolarDataset) : inherits(x, "tbl_df") non è TRUE"

read.table("DatasetFinale.csv", header = T, sep = "," )

        ##but str works
str(SolarDataset)


#remove the first and the last column because we interested into this information
studdf <- as.data.frame(StudDataset[ , -c(1, ncol(StudDataset))])
head(studdf)
