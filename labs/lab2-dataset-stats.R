#### Imports ####
install.packages("tidyverse")
library(tidyverse)

data <- read.csv("data/imdb_clean.csv")
glimpse(data)
summary(data)


#### Raw Data ####
rating <- as.numeric(data$rating)
rating <- data$rating
rating

#if there are NA values use na.rm = T
mean_rating <- mean(rating)
med_rating <- median(rating)
range_rating <- range(rating)
var_rating <- var(rating)
stdev_rating <- sd(rating)
iqr_rating <- IQR(rating)

#q1_rating <-quantile(rating, .25)
#q3_rating <-quantile(rating, .75)
upper_limit <- q3_rating + 1.5 * iqr_rating
lower_limit <- q1_rating - 1.5 * iqr_rating

outliers = rating[rating < lower_limit | rating > upper_limit]

#### Without Outliers ####

rating2 <- rating[rating >= lower_limit & rating <= upper_limit]
plot.new()
boxplot(rating)
boxplot(rating2)

summary(rating2)

mean_rating2 <- mean(rating2)
med_rating2 <- median(rating2)