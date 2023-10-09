# factors from qualitative variables 

species <- c("spec1", "spec2", "spec1", "spec3", "spec2")
sp.factor <- factor(species)
species
sp.factor

sp2.factor <- factor(species, levels=c("spec1","spec2","spec3"))
sp2.factor

summary(sp.factor)

summary(species)

table(sp.factor)

#another example of factors
vec <- c("low","high", "high", "low", "high", "medium")
vec.factor <- factor(vec, ordered= TRUE, levels=c("low", "medium", "high"))

summary(vec.factor)

#data frames from internet or surveys. working with available dataset on R:

data()
?BOD
?iris
#mydataframe mydf
mydf <- iris
str(mydf)
?str
head(mydf)
names(mydf)
names(mydf) <- c("sepallenght", "sepalwidth", "petallenght", "petalwidth", "species")
names(mydf)


#order function based on one variable instread of the order of measurement

sepal_lenght_ord <- mydf[order(mydf$sepallenght),]
sepal_lenght_ord 

sepal_lenght_ord_dec <-  mydf[order(mydf$sepallenght), decreasing = T), ]

#how many obs x species

summary(mydf$species)
table(mydf$species)

table(mydf$sepallenght)
#more clear if converted in categorical variables, function cut
summary(mydf$sepallenght)
cut(mydf$sepallenght, breaks=c(4, 5, 6, 8), labels= c("small", "medium", "large"))
sepal_lenght_cat <- cut(mydf$sepallenght, breaks=c(4, 5, 6, 8), labels= c("small", "medium", "large"))
cbind(mydf$sepallenght, sepal_lenght_cat)
class(sepal_lenght_cat)

cbind(mydf$sepallenght, sepal_lenght_cat)

#to add this column of categorical sepal lenght

mydf$sepallenght_cat <-  sepal_lenght_cat
str(mydf)
#summary applied to categorical variables
summary(mydf$sepallenght_cat)
