#install.packages("dplyr")
library(dplyr)

average_rating <- summarize(imdb_clean, 
                            mean_rating = mean(rating),
                            .by = genre)

arrange(average_rating, desc(mean_rating))

ggplot(data = average_rating, aes(x=mean_rating, y=genre)) +
  geom_point() +
  labs(x = "Mean Rating of Movie",
       y = "Genre of Movie",
       title = "Mean Rating of Each Movie Genre")