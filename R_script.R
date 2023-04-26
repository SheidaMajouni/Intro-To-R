# Intro to R Lesson

# Interacting with R

## I am adding 3 and 5. R is fun!
3 + 5

## I am adding two variable and running multiple lines
x <- 4
y <-  5
print(x + y)
print(x)

# *************** Vector = array ********
# vector or array and printing the whole vector with another element in it
# vector start from 1 not 0
myVector <- c(1,4,3,2)
myVector
print(myVector[2])
print(myVector[-2])
print(myVector[2:3])
print(myVector[myVector > 2])
cat("The second element of x is ", myVector[2], "\n")
length_v <- length(myVector)
print(length_v)
myVector <- c(myVector, 90) # adding at the end	
myVector <- c(30, myVector) # adding at the beginning


# ******************* Factor *************
## Factor is an array that convert categorical in a numerical array. like label encoder. by default based on alphabet
expression <- c("low", "high", "medium", "high", "low", "medium", "high")
expression <- factor(expression)
expression
# to change the order
levels(expression) <- c("low", "medium", "high")
expression

# Create a factor with custom levels
education <- c("high school", "bachelor's", "master's", "bachelor's", "high school")
education_factor <- factor(education, levels = c("high school", "bachelor's", "master's"))
print(education_factor)


# ************ Matrix = 2D array ********
m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2)
print(m)
# get the shape of matrix
shape <- dim(m)
print(shape)
# to change the shape of the matrix
dim(m) <- c(2, 3)
print(m)
print(m[1, 1])
# to print the third row
print(m[3, ])
# to print the second column
print(m[, 2])
# to create a new matrix of the column 2 to 3
m2 <- cbind(m[, 2:3])
print(m2)


# ************** Data Frame *************
df <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 35),
  gender = c("female", "male", "male")
)

print(df)


# ***************** List ****************
# collection of objects that can have different types and structures
mylist <- list(
  numeric_vector = c(1, 2, 3),
  character_vector = c("a", "b", "c"),
  matrix = matrix(1:6, nrow = 2),
  data_frame = data.frame(x = c(1, 2, 3), y = c("a", "b", "c"))
)

print(mylist)
# if we don't assign name to each object when we are creating the list and only pass the object it will label them as 1,2,3,...
# access element in the list by their name or index
print(mylist[2])
print(mylist["matrix"])


# ****************** Loops **************
for (i in 1:5) {
  print(i)
}

i <- 1
while (i <= 5) {
  print(i)
  i <- i + 1
}

x <- 10

if (x > 15) {
  print("x is greater than 15")
} else if (x > 5) {
  print("x is greater than 5 but less than or equal to 15")
} else {
  print("x is less than or equal to 5")
}


# ************** Function ****************
ptint("print sth")
vector_x = c(1,2,3)
vector_y = c(2,5,3)
# factor()

# some statistics functions
mean(x) #mean of a numeric vector x.
sd(x) #standard deviation of a numeric vector x.
var(x) #variance of a numeric vector x.
median(x) #median of a numeric vector x.
min(x) #returns the minimum value of a numeric vector x.
max(x) #returns the maximum value of a numeric vector x.
cor(x, y) #calculates the correlation coefficient between two numeric vectors x and y.
cov(x, y) #calculates the covariance between two numeric vectors x and y.

# some mathematics functions
sqrt(16) # the square root of a numeric value x.
exp(16) # the exponential function of a numeric value x.
log(16) # natural logarithm of a numeric value x.
log10(16) # base 10 logarithm of a numeric value x.
sin(30) # sine of an angle x (in radiant). cos() tan() ....
abs(-20) # returns the absolute value of a numeric value x.
round(3.34647452, 2) # rounds the value x to the specified number of digits.

?round # for help and understand the function
args(round) # returns the names of the arguments
example("round") # gives you some examples of the function

# create your function
add_numbers <- function(x, y) {
  sum <- x + y
  return(sum)
}

result <- add_numbers(3, 4)
result
#tips: 
# define your function at the top of your script
# Create a file that contains all your functions and import the file to your use using the following line
# source("my_functions.R")


# **************** Packages and Libraries *************************
sessionInfo() # check installed packages
install.packages('ggplot2') # to install packages from CRAN repository
library(ggplot2) # load the library into your R session for use
# to see the documentary of the library ==> package in the right bottom ==> click on package name


# ******************** OOP and classes *****************************
setClass("Rectangle", slots = list(length = "numeric", width = "numeric"))

setGeneric("area", function(object) standardGeneric("area"))

setMethod("area", "Rectangle", function(object) {
  return(object@length * object@width)
})

rect1 <- new("Rectangle", length = 5, width = 3)
area(rect1)


# ********************** read / write data *****************************
# read_excel()
# data <- read.csv("path.csv")
metadata <- read.table(file="data/mouse_exp_design.txt")
metadata
head(metadata) # print the the first 6 lines
class(metadata) # check the type of the data ==> when we read it it's data frame

# Sub-setting data
subset(dataframe, column_name == "value")
subset(metadata, celltype == "typeA")
subset(metadata, celltype == "typeA" & genotype == "Wt")
sub_meta <- subset(metadata, replicate < 3, select = c('genotype', 'celltype'))

# wriet on file
write.csv(sub_meta, file="data/subset_meta.csv")

