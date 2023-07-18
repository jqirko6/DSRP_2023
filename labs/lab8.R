library(tidymodels)
library(dplyr)
library(tidyr)
library(janitor)

#### Get Data ####
head(imdb_clean)
clean_names(imdb_clean, case = "small_camel")

#### PCA ####
imdb_num <- select(imdb_clean, -title, -genre, -runtime)
imdb_num

pcas <- prcomp(imdb_num, scale. =T)
summary(pcas)
pcas$rotation

pcas$rotation^2

pca_vals <- as.data.frame(pcas$x)
pca_vals$genre <- imdb_clean$genre

ggplot(pca_vals, aes(PC1, PC2, color = genre)) +
  geom_point() +
  theme_minimal()

#### Unsupervised Learning ####

# 1. Collect Data # 
head(imdb_clean)

# 2. Clean and Process Data # 
data <- na.omit(imdb_clean)
data <- select(data, -title)
imdbFactor <- mutate(data,
                     genre = as.factor(genre))

imdbAllNumeric <- mutate(data, 
               genre = as.integer(as.factor(genre)),
               release_year = as.integer(as.factor(release_year)),
               runtime = as.integer(as.factor(runtime)),
               rating = as.integer(as.factor(rating)),
               `gross(M)` = as.integer(as.factor(`gross(M)`)))

imdb   

# 3. Visualize Correlation #
library(reshape2)
library(ggplot2)

cor(imdbAllNumeric)
imdbCor <- imdbAllNumeric |>
  cor() |>
  melt() |>
  as.data.frame()

# plot correlation
ggplot(imdbCor, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low= "blue", mid = "green", high = "yellow", midpoint = 0) +
  theme_minimal()



      
# 4. Perform Feature Selection

# Classify genre, Predict gross(M)

# 5. Separate data into test and training data 
library(rsample)

set.seed(3251)

data_reg_split <- initial_split(imdbAllNumeric, prop = .75)

train_reg_data <- training(data_reg_split)
test_reg_data <- testing(data_reg_split)

data_class_split <- initial_split(imdbFactor, prop = 0.75)

train_class_data <- training(data_class_split)
test_class_data <- testing(data_class_split)

# 6. Choose  Model

# Classification

binary_train_data <- filter(train_class_data, genre %in% c("Drama", "Comedy"))
binary_test_data <- filter(test_class_data, genre %in% c("Drama", "Comedy"))

logreg_fit <- logistic_reg() |>
  set_engine("glm") |>
  set_mode("classification") |>
  fit(genre ~ ., data = binary_train_data)

  