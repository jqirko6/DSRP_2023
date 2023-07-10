#### install require packages ####
#install.packages("ggplot2")

#### load required packages ####
library(ggplot2)

?ggplot2

ggplot()

#### Grammar of Graphics ####
# Parts of graphical sentence include:
# -the data being plotted
# -the geometric objects (circles, lines, etc.) that appear on
# the plot
# -a set of mappings from variables in the data to the aesthetics
# (appearance) of the geometric objects

ggplot(data = dataset, aes(x = cloumn_name1, y = column_name2)) +
  geom_plotType() +
  labs(title = "title",
       x = "x-axis" ,
       y = "y-axis")

#aes is aesthetic function
#geom are geometries (like box, line, bar graph)

#### Histograms ####
# used to plot the frequency of 1 numeric (usually continuous) variable.names
ggplot(data = dataset, aes(x = column_name)) +
  geom_histogram()

#### Density Plot ####
# Used to plot the frequency of 1 numeric variable
ggplot(data = dataset, aes(x = column_name, 
                           y = after_state(count)))+
  geom_density()

#### Box Plot ####
# Used to plot frequency of 1 numeric variable
# Can also be used to plot the frequency of 1 numeric variable across 1
# categorical variable.
# Provide a summary stats at a glance
ggplot(data = dataset, aes(x = column_name))+
  geom_boxplot


#### Violin Plot ####
# Used to pot frequency of 1 numeric variable across 1 categorical variable
ggplot(data = dataset, aes(x = class, y= column_name)) +
  geom_violin()

#### Colors ####
# 657 built in color names
# or hex-codes can be used
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
       
#### Bar Plots ####
# Bar plots are used to plot either the distribution of 1 categorical 
# variable or to plot 1 numeric variable vs 1 categorical variable.
# By default, geom_bar() provides a count of one categorical variable.
ggplot(data = dataset, aes(x = category_column_name)) +
  geom_bar()


#### Scatterplot ####
ggplot(data = datatset, aes(x=column_1, y=column_2))+
  geom_point()

#### Line Plot ###
ggplot(data = dataset, aes(x=column_1, y=column_2))+
  geom_line