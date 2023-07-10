ls() #print the names of the objects
number <- 5
decimal <- 1.5

logic <- TRUE
logic <- T

#types of variables
# 3 main classes
class(number)
class(decimal) #numeric

class(letter)
class(word) #character

class(logic) #logical

#more variation in types
#all numbers will be //doubles// which means that there is a decimal

typeof(numeber)
typeof(decimal)

#type of obj can be changed w functions
as.character(number)
as.integer(number)
as.integer(decimal)

#round numbers
round(decimal) #less than 0.5 will round down. greater rounds up
round(22/7)
?round

22/7 
ceiling(22/7)#ceiling always rounds up
flood(22/7)#floor always rounds down

?as.integer
as.interger("hello")

word_as_int <- as.integer("hello")

#NA values
NA + 5

#naming
name <-  "meow"
NAME <- "meow2"

### illegal naming characters:
#starts w a number
#starts w underscore
#no spaces
#operations (+ - / *)
#conditionals (& | < > !)
#others (\ ,)

###good naming conventions
#camelCase
#snake_case

###Object Manipulation
number
number + 7

decimal
number + number

name
paste(name, "Parker", "is" , "awesome") #concatenates character vectors


###vectors ####
numbers <- c(2,4,6,8,10)
range_of_vals <- 1:5 #all integers from 1-5
seq()


letters <- c("a" , "b" , "c")
paste("a", "b" , "c")
letters <- c(letters, "d")
letters <- c("x" , letters, "w")

#uuhhh

nums1 <- c(1,2,3)
nums2 <- c(4,5,6)
nums3 <- c(nums1, nums2)

sum(nums3 + 1)
sum(nums3) +1

