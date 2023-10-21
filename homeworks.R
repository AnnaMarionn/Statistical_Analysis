############### Exercise paper 2 - Module 2 ################################
############### Matrices and Dataframes#####################################
############### not mandatory ##############################################
############### solutions will be posted in 7 or 10 days ###################
############### ask in class for short discussion ##########################
############### office hours or office hours in groups for discussion ######



#####Get used to matrices! ######

#1-  create a matrix with three rows and three columns (you choose the data type)
d<-c(1:9)
matrix(d, 3, 3)
#2-  Create three numeric vectors x, y, z, each of 4 elements. Using these vectors create a matrix 
#M1 by using rbind and a matrix M2 with cbind. Check the size of the matrices.
x<- c(1:4)
y<- c(2, 4, 6, 8)
z<- c(10, 20, 30, 40)
M1<-rbind(x,y,z)
M2<-cbind(x,y,z)
M2
length(M1)
length(M2)
#3-  Create M1 and M2 again but now use the "matrix" function. 
#(check whether byrow=TRUE is required)
M1<- matrix(c(x,y,z), ncol = 4, byrow = TRUE)
M1
M2<-matrix(c(x,y,z), ncol = 3, byrow = FALSE)
M2
#4-  Take M1 and calculate the sum of each row, and the sum of each column
sum(M1,)
#5-  Create the matrix M3 as:
#    M3 <- matrix(c(seq(from=1, to=10, by=2), 5:1, c(rep(x=2022, times=4), 2021)), ncol=3)
#    What are the dimensions of M3 (number of rows and number of columns)?
#6-  Add column names to M3: “day”, “month” and “year”, respectively.
#7-  Add row names to M3: letters “A” to “E”
#8-  Shows row(s) of M3 where the month column is greater than or equal to 3.
#9-  Replace all elements of M3 that are equal to 2022 with the year 2023.
#10- Create a new matrix M4 in which all elements of the 1st column of M3 are multiplied by 7.
#11- Add a column to M4 named “time”, that contains values 8, 12, 11, 10, 8
#12- Replace all elements of the second column of M4 that are less than 3 with NA.
#13- Remove rows from M4 if a NA is present. Save in the new object named M5. What is the size of M5?


#Exercise: filtering with relational operator.
# the following matrix m has the score of three students in three tests
# m <- matrix(c(rep(10, 3), 6:8, c(10, 7, 10)), nrow = 3, byrow = T)
# rownames(m) <- c("student_1", "student_2", "student_3")
# colnames(m) <- c("test_1", "test_2", "test_3")
# #Create a matrix containing only the data of the students whose average score is greater than 8.



##### Get used to dataframes! ######

#1- Create the following data frame:
# 43	181	M
# 34	172	F
# 22	189	M
# 27	167	F
#with row names: John, Liam, Bill, Rachel. 
#and column names: age, height, sex
#and name the dataframe df1
#2- check the structure of df1 with str().
#3- calculate the mean age and height 
#4- add one row to df1 about Amie who is 53 years old and 168cm tall.
#5- change the row names of df1 so the data becomes anonymous:
#e.g. use patient1, patient2, etc. instead of their names.
#6- Create the data frame df2 that is a subset of df1 containing only the female.
#7- Create the data frame df3 that is a subset of df1 containing only entries of males taller than 170.
#8- Create the data frame df4 that has the same size of df1 but with different columns order:
# Sex, Height, Age

