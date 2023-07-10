View(iris)
iris

first5 <- iris$Sepal.Length[1:5]
mean(first5)
median(first5)
max(first5)-min(first5)

mean(iris$Sepal.Length)
median(iris$Sepal.Length)
max(iris$Sepal.Length)-min(iris$Sepal.Length)

var(first5)
sd(first5)
sqrt(var(first5))

var(iris$Sepal.Length)

##IQR

IQR(first5) #range of mid 50% of data
quantile(first5, 0.25) #Q1
quantile(first5, 0.75) #Q3

sl <- iris$Sepal.Length

lower <- mean(sl) - 3*sd(sl)
upper <- mean(sl) + 3*sd(sl)

quantile(sl, 0.25) - 1.5*IQR(sl)
quantile(sl, 0.75) + 1.5*IQR(sl)

### subsetting vectors ####
first5
first5 < 4.75 | first5 > 5
first5[first5 < 4.75]

values <- c(first5,3,9)
upper
lower