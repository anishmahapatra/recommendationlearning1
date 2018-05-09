data <- c(sample(x = 1:20, size = 40, replace = TRUE), 65, 80)
summary(data)
data
boxplot(data)
install.packages("plotly")

#Discarding the outlier from the dataset
data1<-data
length(data1)

bench <- 16.00 + 1.5*IQR(data1)
bench

data[data1 > 35]
data[data1 < 35]

data1 <- data1[data1 < bench]
summary(data1)
boxplot(data1)
length(data1)

#Winsorizing is the replacememnt of extremities with bechmark
#Varibale transformation is the process of taking log if the data to be able to normalize the graphs
#kNN imputation
install.packages("VIM")
library("VIM")

