#### mpg dataset ####
library(ggplot2)
str(imdb_clean)

#plot 1
#plot 2 boxplot
#plot 3 scatterplot


#### Plot 1 (distribution of one variable) ####
ggplot(data = imdb_clean, aes(x = rating)) +
  geom_histogram() +
  labs(x = "Movie Rating",
       y = "Frequency",
       title = "Number of Movies per Rating")

#### Plot 2 (between a numeric variable and a categorical variable)
ggplot(data = imdb_clean, aes(x= rating, y= genre))+
  geom_violin() +
  labs(x = "Movie Rating",
       y = "Movie Genre",
       title = "Relationship of Movie Genre and Rating")

### Plot 3 (two different numeric variables ) ####
ggplot(data = imdb_clean, aes(x= rating, y =release_year, color = genre )) +
  geom_jitter() +
  labs(x = "Movie Rating",
       y = "Year of Release",
       title = "Release Year of Movie vs. Movie Rating") 
 