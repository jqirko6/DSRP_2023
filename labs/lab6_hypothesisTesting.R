#### Load libraries ####
library(tidyr)
library(janitor)
library(dplyr)


#### Test for a significant difference between 2 groups ####

# null hypothesis: average rating of drama and action movies are the same
# alternative hypothesis: average rating of drama and action movies are different
# not paired 

imdbRatings <- imdb_clean |> select(rating, genre)
drama <- imdbRatings |> filter(genre == "Drama")
action <- imdbRatings |> filter(genre == "Action")

t.test(drama$rating, action$rating, paired = F)
# p-value is 0.798
# not significant, failed to reject null hypothesis 