# This is R first script

a <- rnorm(5000,0,1)
hist(a,
     probability = TRUE, 
     col = "yellow", 
     main = "Sales Distribution",
     xlab = "values",
     ylab = "density") # Can use rgb() for color code
grid(col = "gray", lty = "dotted", lwd = 0.5)
density(a, adjust = 1.5)
lines(density(a, adjust = 1.5),col = "red", lwd = 2)

x <- 2
typeof(TRUE)
typeof(x)
y <- 2L
typeof(y)
typeof("hello")

cat("I said \"Hello\"")
quote(x <- 2)




