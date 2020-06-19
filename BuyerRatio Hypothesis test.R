#Find if male-female buyer rations are similar across regions
#For four region EAST, WEST,NORTH,SOUTH
##Problem statement-:Determine whether the buyer ratio in all four regions are equal
##95% confidence level 
#5% Tye 1 error
#HYPOTHESIS-:
#Ho-:All proportions are equal
#H1-:Not all Proportions are equal
#since Y is discrete and X is discrete with 4 independent variable
###########Reading the file ############################
ratio <- read.csv(file.choose())
attach(ratio)
View(ratio)
table(ratio)
#######################Chi Square############################
#HYPOTHESIS-:
#Ho-:All proportions are equal
#H1-:Not all Proportions are equal
ratio1 <- stack(ratio)
View(ratio1)
chisq.test(ratio1$values,ratio1$ind)
# p-value = 0.2931 > 0.05.So P high null fly => Accept the null Hypothesis
##################All proportions are equal####################