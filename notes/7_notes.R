#### load in library ####
library(dplyr)
library(ggplot2)

## ANOVA ##
iris

# ~  is representative of .by 
# aov(data = dataset, numeric_var ~ cat_var)

anova_results <- aov(data = iris, Sepal.Length ~ Species)

## Are any groups different from each other?
summary(anova_results)

## Which ones?
TukeyHSD(anova_results)

# All are significantly different 

anova_results <- aov(data = iris, Sepal.Width ~ Species)

summary(anova_results)

TukeyHSD(anova_results)

## Is there a significant difference in the mean petal length or petal widths by species
anova_results_petal <- aov(data = iris, Petal.Width ~ Species)

summary(anova_results_petal)

TukeyHSD(anova_results_petal)


# yes they are significantly different (also if you were to do the same with Petal.Length)

#### Star Wars dataset ####
head(starwars)
unique(starwars$species)

## Which 3 species are the most common?

top3species <- starwars |> 
  summarize(.by = species,
            count = sum(!is.na(species))) |>
  slice_max(count, n = 3)

top3species




starwars_top3species <- starwars |>
  filter(species %in% top3species$species)

starwars_top3species


## Is there a significant difference in the mass of each of the top 3 species?

a <- aov(mass ~ species, starwars_top3species)
summary(a)
TukeyHSD(a)


#### What if we want to compare categorical variables? ####
# We need a different hypothesis test & diff test statistic

#Chi-Squared Test of Independance

## Null hypothesis: cat 1 and cat 2 are independant
## Alt hypothesis: cat 1 and cat 2 are not independant  (there is association)

## Contingency tables
# to get counts per group combination, we can use
# con_table <- table(data$var1, data$var2)


# chisq_results <- chisq.test(con_table)
# to get the significance, we can pull out the p-value from results chisq.results$p.value
# chisq_results$residuals 

# neg residual observed < expected
# pos residual observed > expected
# farther from 0, bigger difference 

#### Practice ####
starwars_clean <- starwars |> 
  filter(!is.na(species),
         !is.na(homeworld))
  
  
t <- table(starwars_clean$species, starwars_clean$homeworld)
chisq.test(t) # not enough data




mpg
table(mpg$manufacturer, mpg$class) # too much missing data,cant do chi square
table(mpg$cyl, mpg$displ) # too much missing data,cant do chi square

## How do we get a contingency table of year and drv?
r <- table(mpg$year, mpg$drv) # at least 10 of each combo, enough info

chisq_result <- chisq.test(r)
chisq_result
chisq_result$p.value
chisq_result$residuals

#install.packages("corrplot")
library(corrplot)

corrplot(chisq_result$residuals)




#### Machine Learning #### 
#Supervised vs. Unsupervised learning
#Supervised Learning: used for classification & regression. Data is labeled. Split data into test & training sets. Used for predictions
#Unsupervised Learning: used for clusters & associations. Data is unlabeled. Used all the data at once. Used for discovery.



## Unsupervised Learnong ##
## Principal Components Analysis ##
head(iris)

## remove any non-numeric variables ## 
iris_num <- select(iris, -Species)
iris_num 

## Do PCA
pcas <- prcomp(iris_num, scale. = T)
summary(pcas)
pcas$rotation



pca_vals <- as.data.frame(pcas$x)
pca_vals$Species <- iris$Species

ggplot(pca_vals, aes(PC1, PC2, color = Species)) +
  geom_point() +
  theme_minimal()