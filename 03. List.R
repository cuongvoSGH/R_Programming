# Creating Matrix
matrix(1:9,nrow = 3, ncol = 3, byrow = TRUE)

a <- array(data = 1:9, dim=c(3,3))

a <- matrix(1:12, nrow = 4, ncol = 3)

attributes(a)

b <- 1:12
b
attr(b, "dim") <- c(4,3)
class(b)
class(a)

a <- matrix(rbinom(n=9, size = 20, prob = .5), 3, 3)
a
det(a)
t(a)

solve(a) # Solve the equation

a[1:2, 2:3]
a[,]
a[1:2,]

a <- matrix(round(rnorm(5*4), 2), 5, 4)
as.vector(a)
a[as.vector(a)>0]

a[,a[1,]>0]
a[a[,2] >0,]
a[a>0]

a
rownames(a)
rownames(a) <- LETTERS[1:5]
colnames(a) <- c("left", "middle left", "middle right", "right")

a[c("A","B","E"),]

a["C", ] # -> Vector
a["C", ,drop = FALSE] # -> Matrix

`[`(a, 1:2, 2:3, drop = FALSE)

# Don't need to quotes the key when defining the list
# If the key is not unique, the value will be the first one, always

a <- list("first" = FALSE, "second" = sin, "third" = "hello", "first" = TRUE, cos)
a

x <- list(
    first = TRUE, 
    second = 57,
    third = 5:1,
    last = FALSE
)
x 
x$first

# [ ] --> list
# [[ ]] --> Value

x[1]
x[1:2]

x[[1]]
x[[1:2]] # fails

x["first"]
x[c("first","second")]

x <- c(x, list("new" = sin))
x$"last one" <- 1:10
x

# Removing an element
x$new <- NULL

x <- x[-1]

# Changing the values
x$new <- cos

x[["new"]] <- 123
x[[2]] <- list(x =1, y =4)

# Changing key
names(x)

names(x) <- c("1", "2", "3")

names(x)[1] <- "1"

x
