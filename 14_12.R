##Module 2 - Lecture 8

##About the project:
## you have to submit 1) the code 2) the report
## we pretend/assume that data comes from a simple random sample

##Recap##
#What we did in Lecture 7
# How to divide into classes a quantitative continuous variable
# in R how to calculate
# Frequency distributions and grouped frequency distributions 
# (functions table(), cut(), ifelse())
# Also bivariate frequency distribuion

#How to draw a barplot
#title of graphs
#customizing axis


#How to draw Histograms and use the function hist() to extract the results

#Since we made several operations with the student dataset
# (added the column eu, added two columns km_cat and km_cat_num)
# For consistency I attach the file


#this was used to create the file you are using
#write.table(x=df, file="stud_data_new.csv", sep=';')
#import data
df <- read.table("C:/Users/annam/Desktop/unibo/stat/Newproject/stud_data_new.csv", dec=".", sep=";", stringsAsFactors = T)
df
str(stud_data_new)


#Legend in plot,

barplot(table(df$travel), names.arg=c("bike","bus","train","walk"), col=c(1,2,3,4))

#we can add a legend. graphical rapresentation work as layers, which we can title

barplot(table(df$travel), names.arg=c("bike","bus","train","walk"), col=c(1,2,3,4), legend.text = T)
title("barplot of travel")

#we put the position as first element, then specify the coordinates (x,y)
legend("topleft", bty='n', title="Legend", cex = 1, text.font=3,
       legend = c("bike","bus","train","walk"),
       fill=c(1,2,3,4)      # Color of the squares)

#mean variance
mean(df$age)
ssq <- mean(df$age^2)-mean(df$age)^2
(length(df$age)/(length(df$age)-1))*ssq
       
var(df$age)   #unbiased sample variance

median(df$age)
quantile(df$age)

summary(df$age)

#with p we clarify level
quantile(df$age, p=0.4)


##Boxplots in R (and Lists), main= name of the graph
boxplot(df$age, main='boxplot of age')

bp <- boxplot(df$age, main='boxplot of age')

       #bp is a list of several variables with different lenghts
bp$stats
bp$n
bp$out
bp$group

#age in two groups, we generale "toy data", a vector with 25 observation, 23 as a mean and 3???, also names to identify the boxplots
agelastyear <- round(rnorm(25, 23, 3))
bp2 <- boxplot(df$age, agelastyear, main='boxplot of age', ann=T, names=c('age this year','age last year'))
a$stats
a$group
a$names

#new dataset
###Covariance, correlation, Scatterplot
data(trees)
tdf <- trees

#covariance: covariance= mean of the product - product of the means BUT using cov and the formula we get different results because of the correction factor
cov(tdf$Height, tdf$Volume)   #this is the unbiased sample covariance

       #appliyng correction factor
mean(tdf$Height*tdf$Volume)-mean(tdf$Height)*mean(tdf$Volume)
(nrow(tdf)/(nrow(tdf)-1))*(mean(tdf$Height*tdf$Volume)-mean(tdf$Height)*mean(tdf$Volume))


#correlation
cor(tdf$Height, tdf$Volume)
# variance of height and of volume
ssq_height <- mean(tdf$Height^2)-mean(tdf$Height)^2
ssq_vol <- mean(tdf$Volume^2)-mean(tdf$Volume)^2
cor_1 <- (mean(tdf$Height*tdf$Volume)-mean(tdf$Height)*mean(tdf$Volume))/sqrt(ssq_height*ssq_vol)
cor_1*(nrow(tdf)/nrow(tdf))   #same thing


#Scatterplot
plot(x = tdf$Height, y = tdf$Volume)
plot(tdf$Height, tdf$Volume, xlab = "height", ylab="volume")
plot(tdf$Height, tdf$Volume, xlab = "height", ylab="volume", main="Scatterplot of tree", 
     col="red", cex=1.1, pch=16)



plot(tdf$Height, tdf$Volume, xlab = "height", ylab="volume", 
     main="Scatterplot of tree", col="red", 
     xaxt='n', yaxt='n', cex.main=1.4, font.main=2, col.main="orange")
#or
plot(tdf$Height, tdf$Volume, xlab = "height", ylab="volume", 
     main="Scatterplot of tree", type="n",
     xaxt='n', yaxt='n', cex.main=1.4, font.main=2, col.main="orange")
abline(h=40)
abline(v=80, lty=2, lwd=2, col="gray")
points(tdf$Height, tdf$Volume, xlab = "height",
       ylab="volume", main="Scatterplot of tree", col='red', pch=1)



#Add points
set.seed(123)
tree2_h <- tdf$Height+rnorm(nrow(tdf))
tree2_v <- tdf$Volume+rnorm(nrow(tdf))
points(tree2_h, tree2_v, xlab = "height",
       ylab="volume", main="Scatterplot of tree", col='blue', pch=16)

#customize axis
axis(1, tick=T, at = c(60,70,80))
axis(2, tick=T, at = c(20,40, 60, 80))
text(x=80, y=77, "add text to a plot", font=3, cex=0.6)
mtext("Text outside the plot", side=3, font=2)
legend(x=62, y=80, title="Legend", legend=c("tree 1", "tree 2"), bty="n", 
       pch=c(1, 16), col=c("red", "blue"))
#?par

##
##How to save graphs
##Multiple panel plots
##
par(mfrow=c(1,2))
plot (tdf$Height, tdf$Volume)
plot (tdf$Height,tdf$volume, col="red", pch=16)

       

#Distributions
#normal 
#cdf normal distribution
pnorm(0)  #probability of normal distribution 
pnorm(2)
pnorm(0, mean = 1, sd = 2)
#cdf student t distribution
pt(0, df=3)
#quantile
qnorm(1/2)
qnorm(pnorm(2))
qt(p=.3, df=3)
#random draw
rnorm(4)
#bernoulli distribution: binomial with size = 1
rbinom(4, 1, 0.4)   

#density
dnorm(x=0)

##Inference!

#test in R and other things
# #Normality test
# hist(iris$Sepal.Width, freq=F)
# lines(density(iris$Sepal.Width), lwd=2) 
# abline(v=mean(iris$Sepal.Width), col='red', lwd=3)
# curve(dnorm(x, mean=mean(iris$Sepal.Width), sd=sd(iris$Sepal.Width)), add=T, col="orange", lwd=2)
# 
# #Normality test
# shapiro.test(iris$Sepal.Length)
# #another way
# qqnorm(iris$Sepal.Length)
# qqline(iris$Sepal.Length)

#Qualitative assessment
hist(df$age, freq=F)
lines(density(df$age), lwd=2) 
#estimate mean age
mean(df$age)
abline(v=mean(df$age), col='red', lwd=3)
curve(dnorm(x, mean=mean(df$age), sd=sd(df$age)), add=T, col="orange", lwd=2)

#Normality test
shapiro.test(df$age)
#another way
qqnorm(df$age)
qqline(df$age)

###



#Inference on the mean of a normal population with known variance
#assume we know that the variance of age is 2.5^2
#point estimation
#estimate mean age
mean(df$age)
v=2.5^2
#measure of accuracy
sqrt(v/nrow(df))
#95% confidence interval 
alpha=0.01
lower <- mean(df$age) - qnorm(p=1-alpha/2) * sqrt(v/nrow(df))
upper <- mean(df$age) + qnorm(p=1-alpha/2) * sqrt(v/nrow(df))
round(c(lower, upper), 2)
#test wheter the mean age is significantly different from 23 years (2%significance level)
tsobs <- (mean(df$age)-23)/sqrt(v/nrow(df))
#Reject H0 if 
tsobs< -qnorm(p=1-0.02/2)
tsobs> qnorm(p=1-0.02/2)
#Reject H0 at 2%significance level
2*(1-pnorm(abs(tsobs)))

#we can also use z.test
#install.packages("BSDA")
library(BSDA)
z.test(df$age, sigma.x = sqrt(v))
z1 <- z.test(df$age, sigma.x = sqrt(v), mu=23, alternative = "two.sided", conf.level = 0.99)
z1$statistic
tsobs

z1$p.value

z1$conf.int
c(lower, upper)
z1$stderr
z1$estimate



# Inference on a normal population unknown variance

#estimate mean age
mean(df$age)
#measure of accuracy
sd(df$age)/sqrt(nrow(df))
#95% confidence interval 
alpha=0.05
lower <- mean(df$age) - qt(p=1-alpha/2, df=nrow(df)-1) * sd(df$age)/sqrt(nrow(df))
upper <- mean(df$age) + qt(p=1-alpha/2, df=nrow(df)-1) * sd(df$age)/sqrt(nrow(df))
round(c(lower, upper), 2)
#test wheter the mean age is significantly different from 23 years (2%significance level)
tsobs <- (mean(df$age)-23)/(sd(df$age)/sqrt(nrow(df)))
#Reject H0 if 
tsobs< -qt(p=1-0.02/2, df=nrow(df)-1)
tsobs> qt(p=1-0.02/2, df=nrow(df)-1)
#Reject H0 at 2%significance level
2*(1-pt(abs(tsobs), df=nrow(df)-1))

#we can also use t.test
t.test(df$age)
t1 <- t.test(df$age, mu=23, alternative = "two.sided")
t1$statistic
tsobs

t1$parameter
t1$p.value

t1$conf.int
c(lower, upper)
t1$stderr
t1$estimate + t1$stderr*qt(1-0.05/2, df=28)

#inference on bernoulli population
#estimate the population proportion/probability that a student can use R
pi <- mean(df$use_R)
#measure of accuracy
sqrt((pi*(1-pi))/nrow(df))
#check np n(1-p)
nrow(df)*mean(df$use_R)
nrow(df)*(1-mean(df$use_R))
#ok
pi0=0.2
tsobs <- (mean(df$use_R)-pi0)/sqrt((pi0*(1-pi0))/nrow(df))
z.test(df$use_R, alternative="greater", mu=pi0, sigma.x = sqrt((pi0*(1-pi0))),  conf.level = 0.99)

##test about a variance
#install.packages("EnvStats")
library(EnvStats)
varTest(df$age, alternative="two.sided", sigma.squared = 1)
((length(df$age)-1)*var(df$age))/qchisq(0.05/2, df = length(df$age)-1)
((length(df$age)-1)*var(df$age))/qchisq(1-0.05/2, df = length(df$age)-1)


#### two samples ####

df$age
agelastyear
#is the mean age different?
#First : assume known variance
z.test(df$age, agelastyear, alternative = "two.sided", mu=0, sigma.x = 2, sigma.y = 1.5, conf.level = 0.99)
# do not assume known variance: t-test
t.test(df$age, agelastyear, alternative = "two.sided", mu=0, var.equal=T, conf.level = 0.99)
#two sample t-test on the proportion
#assume sample data 
set.seed(123)
useRlastyear <- rbinom(n = 25, size = 1, prob = 0.35)
n1 <- length(df$use_R)
n2 <- length(useRlastyear)
p1 <- sum(df$use_R)/n1
p2 <- sum(useRlastyear)/n2


#pp <- (n1*p1+n2*p2)/(n1+n2)
#(p1-p2)/sqrt(pp*(1-pp)*(1/n1+1/n2))


aa <- prop.test(x = c(sum(df$use_R), sum(useRlastyear)), n = c(n1, n2), alternative = "greater", correct = F)
#sqrt(aa$statistic)

##Two sample test on the variance
var.test(df$age, agelastyear, ratio = 1, alternative = "two.sided")



##Chi square test
?chisq.test
#1) independence
#Create a sample dataset
set.seed(123)
grade <- sample(seq(18,31), size=100, replace = T)
gender <- rbinom(n=100, 1, prob=1/3)
gender <- ifelse(gender==0, "M", "F")
mark <- cut(grade, breaks = c(17, 23, 26, 31), labels = c("low", "medium", "high"))
bw=round(rnorm(100, 58, 2), 1)
df_s <- data.frame(gender, mark, grade, bw)

chisq.test(table(df_s$gender, df_s$mark))
ctest <-chisq.test(table(df_s$gender, df_s$mark))
ctest$statistic
#calculate cramer V
sqrt(ctest$statistic/(100))
ctest$parameter
ctest$p.value
ctest$observed
ctest$expected
ctest$residuals
sum((ctest$residuals^2))


##Correlation test - make inference on the correlation parameter
cor(df_s$grade, df_s$bw)
cor.test(df_s$grade, df_s$bw, alternative = "two.sided")
a <- cor.test(df_s$grade, df_s$bw, alternative = "two.sided")
a$statistic
