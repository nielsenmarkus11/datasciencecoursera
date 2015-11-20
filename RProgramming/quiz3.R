# Question 1
library(datasets)
data("iris")

sapply(split(iris$Sepal.Length,iris$Species),mean)

# Question 2
apply(iris[, 1:4], 2, mean)
rowMeans(iris[, 1:4])
apply(iris[, 1:4], 1, mean)
colMeans(iris)

# Question 3
data("mtcars")

split(mtcars, mtcars$cyl)
apply(mtcars, 2, mean)
mean(mtcars$mpg, mtcars$cyl)
tapply(mtcars$mpg, mtcars$cyl, mean)

# Question 4
ahp <- tapply(mtcars$hp,mtcars$cyl, mean)
abs(ahp["4"]-ahp["8"])

# Question 5
debug(ls)
ls()
