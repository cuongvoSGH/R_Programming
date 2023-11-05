# Vector in R

# Using c for creating vector

c(1, 3, 7)
c("hello", "this", "is", "Cuong", "at Poland")
c("first" = 5, "second" = 7, "last" = 9) 

#Create vector with regular

1:5
5:1
1.1:5

2*2:6 # --> 4 6 8 10 12

1:2^3 # --> 1 2 3 4 5 6 7 8

(2 * 2) : 6 #--> 4 5 6

# Using seq()
seq(from = 0, to = 1, by = .1)
seq(from = 0, to = 1, length.out = 7)

y <- rnorm(5)
seq(from = 0 , to = 1, along.with = y) #--> lenght of vector = length of y

#Using rep()

rep(1:4, 5)
rep(c("Hi", "Bye"),5)

x <- 1:5

sin(x)
exp(x)
log(x)
x^2
sqrt(x)

length(x)
min(x)
max(x)
mean(x)
quantile(x, .3)
range(x)

x <- 1:4
y <- 4:1

x <- 1:2
y <- 1:3
x * y

x + y

suppressWarnings(x * y)

x %*% y

sqrt(x %*% y)

#recycling but only work when 2 length vector are multiple of each other --> using suppressWarnings
x <- 1:4
y <- 1:2
x + y


x <- 1:5
y <- 1:2
suppressWarnings(x+y)

# My Answer
k = readline();
k =  as.integer(k);

x <- c(1:k) * 0 # x <- rep(0,k)
y <- c(0:1)
z <- c(0,0,5)
suppressWarnings(x + y + z)

# Prof Answer
k <- 20
K <- 12 * k
x <- rnorm(n = K)
#s <- rbinom(n = 12, size = 10, prob = 0.5) 
s <- sample(c(1:10), size = 12, replace = TRUE)
y <- x + s

plot(x = 1:K, y = y, pch = 20, type = "o")
plot(x = rep(1:12,k), y = y, pch= 20, type = "p")
plot(x = jitter(rep(1:12,k)), y = y, pch= 20, type = "p", col = "red")
abline(v = 1:11 + 0.5, col = "gray", lty = "dashed")

# not have vector inside vector, type of data will be the type of the last item
# Can not have 2 difference type in 1 vector

c(NA, NaN, Inf)

exp(-Inf)

a <- c(1:10)
length(a)

a[1]
a[2]
a[c(1,4)] 
a[1:3]

a[sample(1:5, size= 50, replace = TRUE)]

r <- seq(from = 0, to = 1, by = .1)
g <- seq(from = 0, to = 1, by = .1)
b <- seq(from = 0, to = 1, by = .1)

x <- rnorm(10,0,1)
x[x>0]
x[x<0]
x[x > -1 & x < 1]
lab <- sample(LETTERS[1:2],10, replace = TRUE)
x[lab == "A"]
x
cbind(x,lab)

hist(x, 
    probability = TRUE, 
    col = rgb(
              sample(r,1,replace = TRUE),
              sample(g,1,replace = TRUE),
              sample(b,1,replace =  TRUE)))

x <- c("first" = 5, "second" = 99, "third" = 123, "last" = 54)
x
x["first"]
x[c("first", "last")]

# Function f(x) = (x-1)(x+1) colors for positive and negative are blue and red.
# the plot is over the interval from -2 to 2

x <- sample(seq(from = -2, to =2, by = 0.001), size = 10000, replace =  TRUE)
y <- (x-1) * (x+1)
plot(x,y,pch=5,col = ifelse(y>0,"blue","red"))

# Second way
ind <- y >0
plot(x,y,col="white")
points(x[ind],y[ind],col="blue")
points(x[!ind],y[!ind],col="red")

# Third way
x <- seq(from = -2, to = 2, length.out = 10^3)
y <- (x-1) * (x+1)
ind <- y <0
indx <- x<0
plot(x,y,col="white")
lines(x[ind],y[ind],pch = 20,col="red")
lines(x[!ind & indx],y[!ind & indx],pch = 20,col="blue")
lines(x[!ind & !indx],y[!ind & !indx],pch=20,col="blue")
abline(v=0, h =0, lwd = .5, col = "black", lty = "dashed")

