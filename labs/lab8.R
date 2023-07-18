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

# 1. Collect Data ####
head(imdb_clean)

# 2. Clean and Process Data ####
data <- na.omit(imdb_clean)
data <- select(data, -title)


imdbAllNumeric <- mutate(data,
              genre = as.integer(as.factor(genre)),
              release_year = as.integer(as.factor(release_year)),
              runtime = as.integer(as.factor(runtime)),
              rating = as.integer(as.factor(rating)),
              `gross(M)` = as.integer(as.factor(`gross(M)`))
              )

imdbFactor <- select(mutate(data,
                     genre = as.factor(genre),
                     release_year = as.factor(release_year)),
                     genre, release_year
                     )
                     


# 3. Visualize Correlation ####
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



      
# 4. Perform Feature Selection ####

# Classify genre, Predict gross(M) ####

# 5. Separate data into test and training data  ####
library(rsample)
library(MLmetrics)

set.seed(3251)

data_reg_split <- initial_split(imdbAllNumeric, prop = .75)

train_reg_data <- training(data_reg_split)
test_reg_data <- testing(data_reg_split)

data_class_split <- initial_split(imdbFactor, prop = 0.75)

train_class_data <- training(data_class_split)
test_class_data <- testing(data_class_split)

# 6. Choose  Model 7. Train Model ####

## Regression 

# Linear Regression
linreg_fit <- linear_reg() |>
  set_engine("lm") |>
  set_mode("regression") |>
  fit(`gross(M)`~., data = train_reg_data)

summary(linreg_fit$fit)


imdbPred <- test_reg_data
imdbPred$linReg <- predict(linreg_fit, test_reg_data)$.pred

yardstick::mae(imdbPred, truth = `gross(M)`, estimate = linReg)
yardstick::rmse(imdbPred, truth = `gross(M)`, estimate = linReg)

# Boosted Decision Tree

boost_tree_fit <- boost_tree() |>
  set_engine("xgboost") |>
  set_mode("regression") |>
  fit(`gross(M)` ~ ., data = train_reg_data)

boost_reg_fit$fit

imdbPred2 <- test_reg_data
imdbPred2$logReg <- predict(boost_tree_fit, test_reg_data)$.pred

yardstick::mae(imdbPred2, truth = `gross(M)`, estimate = logReg)
yardstick::rmse(imdbPred2, truth = `gross(M)`, estimate = logReg)




## Classification 

# boost tree

boost_tree_fit2 <- boost_tree() |>
  set_engine("xgboost") |>
  set_mode("classification") |>
  fit(genre ~ ., data = train_class_data)

boost_tree_fit2$fit

imdbPredC <- test_class_data
imdbPredC$logReg <- predict(boost_tree_fit2, test_class_data)$.pred_class

F1_Score(imdbPredC$logReg, imdbPredC$genre)

# random forest

rand_forest_fit <- rand_forest() |>
  set_engine("ranger") |>
  set_mode("classification") |>
  fit(genre ~ ., data = train_class_data)

rand_forest_fit$fit

imdbPredD <- test_class_data
imdbPredD$logReg <- predict(rand_forest_fit, test_class_data)$.pred_class

F1_Score(imdbPredD$logReg, imdbPredD$genre)