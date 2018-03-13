setwd("E:/CrewKarma/R Code/Concepts/Multiple_Linear_Regression")

#Multiple Linear Regression
#https://www.youtube.com/watch?v=8vT_jNK16mU

#Importing the dataset
dataset = read.csv("50_Startups.csv")
#dataset = dataset[, 2:3]

#Splitting the dataset into Training and Test Set
# install.packages('caTools')
library(csTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])
