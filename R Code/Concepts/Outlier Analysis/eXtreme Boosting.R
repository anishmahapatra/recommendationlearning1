install.packages("xgboost")
install.packages("magrittr")
install.packages("dplyr")
install.packages("Matrix")

library(xgboost)
library(magrittr)
library(dplyr)
library(Matrix)

#Data 
data <- read.csv(file.choose(), header=TRUE)
str(data)
data$rank <- as.factor(data$rank)

#Partition Data
set.seed(1234)
ind <- sample(2, nrow(data), replace = TRUE, prob=c(0.8,0.2))
train <- data[ind=1,]