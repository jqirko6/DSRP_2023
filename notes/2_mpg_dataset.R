#### mpg dataset ####
library(ggplot2)
str(mpg)
?mpg

#### Line plot ####
ggplot(data = mpg, aes(x = hwy, y = cty)) +
  geom_point()+
  labs(x = "highway mpg",
       y = "city mpg" ,
       title = "Car City vs. Highway Mileage")

#### Histogram ####
ggplot(data = mpg, aes(x=hwy)) +
  geom_histogram()+
  labs(x = "Highway mpg",
       y = "Frequency")

#### Density Plot ####
ggplot(data = mpg, aes(x=hwy)) +
  geom_density()

#### iris dataset ####
#can set the number of bars with 'bins'
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram(bins = 50)

#we can set the size of bars with 'binwidth'
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = .25)

head(iris)

#density plot here too
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_density()+
  labs(title = "Frequency of Iris Sepal Lengths",
       x = "Sepal Lengths", 
       y = "Density")

#Box plot
#vert
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_boxplot()

#horz
ggplot(data = iris, aes(y = Sepal.Length)) +
  geom_boxplot()

ggplot(data = iris, aes(x = Sepal.Length, y = Species)) +
  geom_boxplot()

#violin plot
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin()

#can layer plots
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin() + geom_boxplot(width = 0.2) +
  labs(title = "Distribution of Iris Sepal Lengths by Species",
       x = "Species" ,
       y = "Sepal Length")

#color!
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin(color = "navy", fill = "turquoise") + 
  geom_boxplot(width = 0.2, fill = "turquoise4") +
  labs(title = "Distribution of Iris Sepal Lengths by Species",
       x = "Species" ,
       y = "Sepal Length")

ggplot(data = iris, aes(x = Species, y = Sepal.Length )) +
  geom_violin(aes(fill = Species)) + 
  geom_boxplot(width = 0.2, fill = "turquoise4") +
  labs(title = "Distribution of Iris Sepal Lengths by Species",
       x = "Species" ,
       y = "Sepal Length")

#bar plot
ggplot(data = iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_bar(stat = "summary",
           fun = "mean")

#scatter plot
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_point()

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_jitter()

#Line plot
ggplot(data= iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_line(stat = "summary",
            fun = "mean")

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_smooth(se = F) +
  theme_minimal()

ggplot(data = iris, aes(x= Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color=Species)) +
  scale_color_manual(values = c("violet", "lightpink" , "red"))


#Factors 
mpg$year <- as.factor(mpg$year)

iris$Species <- factor(iris$Species, levels = c("versicolor, setosa, viraincica"))