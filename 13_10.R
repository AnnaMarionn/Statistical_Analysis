#student survey answers

str(stud.df)

#different units(cm-m) for answers, or same word in capital letters (Rreads them as different characters), or somet mistakes to fix (weird values)
#to check: function which (example height) -> for a survey closed onswer is easier

stud.df$heigh
which (stud.df$height < 100)

#or

stud.df$heigh[stud.df$height<100]<-181

#country (problem with character, even a space is a different word)

class(stud.df$country)

#we want it to be a factor instead of character, first we want all lower case

stud.df$country[stud.df$country=="ITALY"] <- "Italy"
stud.df$country[stud.df$country=="italy"] <- "Italy"
stud.df$country[stud.df$country=="Italy "] <- "Italy"

stud.df$country <- as.factor(stud.df$country)

# roomate (7000<- 7 or NA)
stud.df$roomate[stud.df$roomate >10] <- NA

#to check from colums x to col y

stud.df[, 6:10]

#km (. or , and different units)
class(stud.df$km_travel) # to check 
as.numeric(stud.df$km_travel)

#vector with position of incorrect values (first vector with true and false if the value is na)

idx <- is.na(as.numeric(stud.df$km_travel))

#let's filter column of km using idx vector

stud.df$km_travel[idx]   #it gives me a vector of all weird values

stud.df$km_travel[stud.df$km_travel== "600 metri"] <- 0.6
#or (easier cus u can copy and paste)
stud.df$km_travel[idx[2]] <- 2
stud.df$km_travel[idx[3]] <- 2.5
stud.df$km_travel[idx[4]] <- 1
stud.df$km_travel[idx[5]] <-35
stud.df$km_travel[idx[6]] <- 2
stud.df$km_travel[idx[7]] <- 2
stud.df$km_travel[idx[8]] <- 1.8
stud.df$km_travel[idx[9]] <- 2
#...

#then let's change it in numeric

stud.df$km_travel <- as.numeric(stud.df$km_travel)
