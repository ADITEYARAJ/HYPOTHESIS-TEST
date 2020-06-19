#Hospital wants to determine whether there is any difference in the average Turn Around Time (TAT) 
#For reports of 4 laboratories
#Problem statement-:Determine whether there is any difference in average TAT 
##95% confidence level 
#5% Tye 1 error
#HYPOTHESIS-:
#Ho-:There is no difference in average TAT
#H1-:There is significant difference in average TAT
#since Y is continious (time) and X is discrete with 4 independent variable
###########Reading the file ############################
tat <- read.csv(file.choose())
attach(tat)
View(tat)
library(ggplot2)
#############Normality test###########################
#HYPOTHESIS-:
#HO-:Data are normal
#H1-:Data are not normaly distributed 
ggplot(tat,aes(Laboratory.1))+geom_histogram(color="black",fill="blue")
shapiro.test(Laboratory.1)
#p-value = 0.5508 > 0.05. So P high null fly <- Laboratory.1 is normay distributed
ggplot(tat,aes(Laboratory.2))+geom_histogram(color="black",fill="green")
shapiro.test(Laboratory.2)
#p-value = 0.8637 > 0.05. So P high null fly <- Laboratory.2 is normay distributed
ggplot(tat,aes(Laboratory.3))+geom_histogram(color="black",fill="grey")
shapiro.test(Laboratory.3)
#p-value = 0.4205 > 0.05. So P high null fly <- Laboratory.3 is normay distributed
ggplot(tat,aes(Laboratory.1))+geom_histogram(color="black",fill="gold")
shapiro.test(Laboratory.4)
#p-value = 0.6619 > 0.05. So P high null fly <- Laboratory.4 is normay distributed
qqplot(Laboratory.1,Laboratory.2)
qqplot(Laboratory.3,Laboratory.4)
library(tidyverse)
#############Variance test###########################
#HYPOTHESIS-:
#HO-:All Variance are equal
#H1-:At least one Variance are unequal
library(dplyr)
#check for the variance in data
bartlett.test(list(Laboratory.1,Laboratory.2,Laboratory.3,Laboratory.4))
# p-value = 0.1069 > 0.05.So P high null fly <- All variance are equal

#############One way Anova############################
#Ho <- There is no difference in average TAT
#H1 <- There is significant difference in average TAT
tat1 <- stack(tat)
View(tat1)
attach(tat1)
Anova_results <- aov(values~ind,data = tat1)
summary(Anova_results)
#P-value=2e-16 < 0.05.So P low null go <- fail to accept null hypothesis
##############There is significant difference in average TAT##########################
















