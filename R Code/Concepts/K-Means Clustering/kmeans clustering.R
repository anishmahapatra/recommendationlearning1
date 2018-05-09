View(iris)
Iris.features = iris
Iris.features$Species <- NULL
View(Iris.features)
results <- kmeans(Iris.features, 3)
table(iris$Species, results$cluster)
#Predicted with Sepal
plot(iris[c("Sepal.Length", "Sepal.Width")], col = results$cluster)
#Actual with Sepal
plot(iris[c("Sepal.Length", "Sepal.Width")], col = iris$Species)

#Predicted with Petal'
plot(iris[c("Petal.Length", "Petal.Width")], col = results$cluster)
#Actual with Petal
plot(iris[c("Petal.Length", "Petal.Width")], col = iris$Species)



