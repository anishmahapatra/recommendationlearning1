library(readr)
housing <- read_table("https://archive.ics.uci.edu/ml/machine-learning-databases/housing/housing.data", col_names = FALSE)
View(housing)

colnames(housing) <- c("CRIM", "2N", "INDUS", "CHAS", "NOX", "RM", "AGE", "DIS", "RAD", "TAX", "PTRATIO", "B","LSTAT","MEDV")
plot(MEDV ~ AGE, data=housing)

help(lm)
house <- lm(MEDV ~AGE, data = housing)

abline(a = house[[1]][1], b=house[[1]][2])
install.packages("MASS")
#confint(housing, level = 0.95)
formula(house)

#residuals = difference between prdicted and true value
coef(house)
re <- residuals(house)
length(re)

fit <- fitted(house)
length(fit)
summary(house)

house.all <- lm(MEDV ~ . , data=housing)
