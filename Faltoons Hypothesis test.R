#Fantaloons Sales managers commented that % of males versus
#females walking in to the store differ based on day of the week
#Problem  Statement-:sales differ in weekdays/weekend in male/female
###95% confidence level 
#5% Tye 1 error
#HYPOTHESIS-:
#Ho-:proportion of male is equal to proportion of females
#H1-:proportion of male is NOT equal to proportion of females
###########Reading the file ############################
sales <- read.csv(file.choose())
View(sales)
str(sales)
attach(sales)
sales$Weekdays <- as.numeric(sales$Weekdays)
sales$Weekend <- as.numeric(sales$Weekend)
library(RColorBrewer)
hist(sales$Weekdays,breaks=2,col=brewer.pal(10,"Accent"))
hist(sales$Weekend,breaks=2,col=brewer.pal(3,"Paired"))
###################Proportional T Test##################################
table(sales$Weekdays,sales$Weekend)
prop.test(x=c(66,47),n=c(167,120),correct = T,conf.level = 0.95,alternative = "two.sided")
## two. sided -> means checking for equal proportions of male and female under purchased
#p-value = 1 >0.05.So fail to reject the null Hypothesis
####################proportion of male is equal to proportion of females###########################
