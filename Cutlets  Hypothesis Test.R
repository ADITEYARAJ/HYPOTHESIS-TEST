#F&B managerwants to determine whether there is any significant difference
#in the diameter of the cutlet between two units
#problem statement-:Difference in diameter between two units
#95% confidence level 
#5% Tye 1 error
#HYPOTHESIS-:
#HO <- No difference in diameter
#H1 <- Difference in diameter
#since Y is continious (diameter) and X is discrete 
###########Reading the file ############################
library(readxl)
cutlets <- read.csv(file.choose())
attach(cutlets)
View(cutlets)

#############Normality test###########################
#HYPOTHESIS-:
#HO-:Data are normal
#H1-:Data are not normaly distributed 
shapiro.test(Unit.A)
# p-value = 0.32>0.05. So P high null fly <- Unit.A is normay distributed
shapiro.test(Unit.B)
#p-value = 0.5225. So P high null fly <- Unit.B is normay distributed
qqplot(Unit.A,Unit.B)
library(ggplot2)
ggplot(cutlets,aes(Unit.A))+geom_histogram(color="black",fill="blue")
ggplot(cutlets,aes(Unit.B))+geom_histogram(color="black",fill="green")
#############Variance test###########################
#HYPOTHESIS-:
#HO-:Variance are equal
#H1-:Variance are unequal
var.test(Unit.A,Unit.B)
# p-value = 0.3136>0.05.So P high null fly <- variance are equal

############2 sample T Test ##################
t.test(Unit.A,Unit.B,alternative = "two.sided",conf.level = 0.95,correct=T)
# alternative = "two.sided" means we are checking for equal and unequal
# means
# null Hypothesis -> Equal means
# Alternate Hypothesis -> Unequal Hypothesis
# p-value = 0.4723 > 0.05 accept NULL Hypothesis 
# equal means

t.test(Unit.A,Unit.B,alternative = "greater",var.equal = T)

#Ho <- there is no difference in diameter of two unit
#H1 <- there is significant difference in diameter of two unit
#p-value = 0.2361>0.05.So we fail to reject the NULL Hypothesis
#######TNhere is no difference in diameter of two unit##############################



























