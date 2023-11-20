for (f in list(sin, cos, log, exp)) {
  print(f(1))
}

cond <- TRUE
while (cond){
  x <- rnorm(1, mean = 1.3)
  print(x)
  cond <- x >0
}

for (i in 1:5){
  if (i == 3) break
  print(i)
}

# Break only work for the closest loops


initial_wd <- getwd()
dirDataName <- "./data"
numberofFiles <- 100
numberofNumbers <- 10

if (!dir.exists(path =dirDataName)){
  dir.create(path = dirDataName)
}

setwd(dirDataName)

for (i in 1:numberofFiles){
  fileName <- paste0("data_", as.character(i),".csv")
  d <- data.frame(value = rnorm(numberofNumbers))
  write.csv(d, fileName)
}

setwd(initial_wd)


dirDataName <- "./data"
numberofFiles <- 100
numberofNumbers <- 10

files <- dir(path = dirDataName, pattern = "csv$", full.names = TRUE)

v <- c()
for (f in files){
  v <- c(v, read.csv(file = f)$value)
}

hist(x = v, density = 20, angle = -45, col = "red", probability = TRUE, breaks ="Scott")

# Function in R return the last expression

f <- function(...){
  for (a in list(...)){
    print(a)
  }
}

f(1,2,7,9)

# `[` Bracket Function
# `[<-` Insert Function
# `(` <- Also the function, can be define as function
# %*%
# %%
# %/%

(function(x) {x^2})(4)

1:5 %*% 5:1 # --> Product

`%G%` <- paste # --> can assign the function to the variance
"hello" %G% "world !!!!"

a <- b <- 5
a

`%A%` <- function(left, right){
  right(left)
}

4 %A% sqrt
-4 %A% abs %A% sqrt

m <- 10^3 %A% 
  function(n) {data.frame(x = rnorm(n))} %A% 
  function(d) {cbind(d, data.frame(y = 1 + 2 * d$x + rnorm(dim(d)[1])))} %A% 
  function(d) {plot(d, pch=20, col = rgb(1,0,0,.2)); d} %A%
  function(d) {model = lm(y ~ + 1 + x, data = d); abline(model,col = "blue"); model}
summary(m)


makeAdd <- function(x){
  function(y){x+y}
}

f7 <- makeAdd(7)
f7(3)

makeAdd(9)(11)

rm(list = ls())

x <- 5
x

f1 <- function(x){
  print(x)
}

f1(x=17)
x

f2 <- function() {
  print(x)
  x <- 999
  print(x)
}

f2()

a <- matrix(rnorm(10^3 * 10^5), 10^5, 10^3)

dim(a)
tStart <- Sys.time()
r <- c()
for (j in 1:dim(a)[2]){
  r <- c(r, mean(a[,j]))
}
tEnd <- Sys.time()
tEnd - tStart
r

tStart <- Sys.time()
ar <- apply(X = a, MARGIN = 2, FUN = mean)
tEnd <- Sys.time()
tEnd - tStart
ar

# Avoid to create new object, using the existing one and change the value of it

b <- list(1,2,3,4)

lapply(X = b, FUN = function(x) {x^2})
sapply(X = b, FUN = function(x) {x^2})

b <- list(sin, cos, log, exp)
sapply(X = b, FUN = function(f) {f(1)})
