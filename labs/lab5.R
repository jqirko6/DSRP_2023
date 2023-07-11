## load libraries
library(dplyr)
library(ggplot2)

imdb_clean
head(imdb_clean)


#### filter() ####
filter(imdb_clean, between(rating, 8.0, 9.5))