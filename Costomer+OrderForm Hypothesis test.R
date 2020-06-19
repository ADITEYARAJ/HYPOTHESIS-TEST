#The TeleCall manager wants to check whether the defective %  varies by centre
#TeleCall uses 4 centers around the globe 
###Problem statement-:Determine whether the defective ratio in all four regions are equal
###95% confidence level 
#5% Tye 1 error
#HYPOTHESIS-:
#Ho-:The defective % do not varies by centre
#H1-:The defective %  varies by centre
#since Y is discrete and X is discrete with 4 independent variable
###########Reading the file ############################
defect <- read.csv(file.choose())
View(defect)
str(defect)
table(defect)
defect$Phillippines <- as.numeric(defect$Phillippines)
defect$Indonesia <- as.numeric(defect$Indonesia)
defect$Malta <- as.numeric(defect$Malta)
defect$India <- as.numeric(defect$India)
#######################Chi Square############################
#HYPOTHESIS-:
#Ho-:All proportions are equal
#H1-:Not all Proportions are equal
stack1 <- stack(defect)
View(stack1)
chisq.test(stack1$values,stack1$ind)
#p-value = 0.2771>0.05.So P high null fly => Accept the null Hypothesis
##################All proportions are equal####################
