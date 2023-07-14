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




#### Test for significant difference between 3 groups ####
# top 3 genres

top5Genre <- imdb_clean |>
  summarize(.by = genre,
            count = sum(!is.na(genre))) |>
  slice_max(count, n = 5)
top5Genre

## Drama, Comedy, Action, Crime, Adventure
imdb_top5Genre <- imdb_clean |> 
  filter(genre %in% top5Genre$genre)
imdb_top5Genre

## Is there a significant difference in the rating of the top 5 movie genres?
## null-hypothesis: There is no difference in average rating between the top 5 IMDB movie genres
## alt hypothesis: There is a difference in average rating between the top 5 IMDB movie genres

a <- aov(rating ~ genre, imdb_top5Genre)
summary(a)
TukeyHSD(a)

# significant, does not reject null hypothesis



#### Test for significant association between categorical variables ####
## variables: genre + release_year
## Null hypothesis: Movie genre is independent from the release year of the movie

t <- table(imdb_clean$genre, imdb_clean$release_year)
t

chisq_result <- chisq.test(t)
chisq_result
chisq_result$p.value
chisq_result$residuals
