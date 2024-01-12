##### Getting used to vectors!  ##### 

#1-create two numeric vectors (you can choose the number), each with 3 elements. 
# Name them x and y.
x <- c(2, 4, 6)
y <- c(1, 3, 5)
#2-check the vectors' lenght
length(x)
length(y)
#3-what is the result of x+y? What will be the vector length?
x+y
length(x+y)

#4-sum the elements of x
sum(x)

#5-sum the elements of y*y
sum(y*y)

#5-create a new vector (named z) which is 2x
z <- 2*x
z

#6-find the minimum of z
min(z)

#7-create a numeric vector with all the integers from 32 to 56
vecinteger <- c(32L:56L)
vecinteger
length(vecinteger)
#8-create a numeric vector with the same length as the previous one but only 
#containing the number -2
rep(-2,25)

#9-create a numeric vector with the numbers from 2 to 5 equally spaced with a 
#step size of 0.3
seq(2, 5, 0.3)

#10-create a vector of size 2 with your name and your surname
anna <- c("Anna", "Marion")
anna
#11- consider the following vector (create it)
veggies <- c("apple", "banana", "orange", "kiwi", "potato")

#12-Create a vector of logic values that can be used to extract the second element
#from your character vector
veggies[2]

#13-create a new vector named fruit selecting only the fruits from the vector veggies
fruit <- veggies[c(1:4)]
fruit
#14-create a numeric vector, v, with length 500
v <- rep(NA, 500)
v[3] <- 8
#15-use a relational operator to check if the length of v is 500 (i.e., code should return TRUE)
length(v) == 500
#16-create a numeric vector, v2, whose length is 1000. This vector should be an even-spaced sequence of numbers from 3 to -9
v2 <- seq(3,-9, length.out=1000)
v2
#17-create a new vector, v3, by removing the last 10 elements of v2 and keeping all the other values. 
#hint: use negative indices and the function length()
v3 <- v2[-(991:1000)]
v3
length(v3)
#18-what is the last value of v3?
min(v3)
#19-use a relational operator to check if the length of v3 is equal to the length of v1 minus 10. 
length(v3) == length(v2)-10
#20-create a vector with your name containing your name, your surname and your age. Which is the type of this vector and why?
anna <- c("Anna", "Marion", 22)
typeof(anna)
# Bonus exercise - our fist data organization and analysis
### You have collected the age of the 20 students and you have stored the information into a vector (named "age")
age <- c(22, 23, 35, 21, 26, 34 ,21, 30, 27, 22, 23, 22, 24, 25, 44, 21, 26, 34 ,21, 30)
length(age)
#Imagine that you want to divide the students by their age. In particular you want to divide the students into two categories:
# "young" for those younger than 25 years old and "old" for those with 25 years or older. 
# 1) find the minumim and maximum age and the arithmetic mean
min(age)
max(age)
mean(age)
# 2) create a vector of character in which for each student you have the label "young" or "old" according to the category to which the student belongs
labelvec <- c(NA, 20)
age[which(age<25)] <- ""
# 3) create a vector which stores logical value indicating whether a student is young or not.
oldvector <- age>=25
oldvector
# 4) find the frequency of old students and the corresponding relative frequency
# 5) find the mean age of the young students and the mean age of the old ones.
