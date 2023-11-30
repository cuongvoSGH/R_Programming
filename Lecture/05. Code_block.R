{
  x <- rnorm(100)
  mean(x)
}

data(cars)
head(cars)
plot(cars, pch = 20, col ='red')
model <- lm(cars$dist ~ +1 + cars$speed)
abline(model, lwd = 4, col = 'yellow')

with(cars, {
  plot(x = speed, y = dist, pch = 20, col = 'red')
  model <- lm(dist ~ + 1 + speed)
  abline(model, lwd = 4, col = 'yellow')
})


x <- c(TRUE, FALSE)
y <- c(TRUE, TRUE)

x
!x
x & y 
x | y

identical(2,2)
identical(2,2L)
identical(2,"2")

x <-2

if (x %% 2 == 0) {
  print("Even")
} else {
  print("Odd")
}

b <- -1
switch(b, 
"1" = {print("1a")},
"2" = {print("2a")},
"3" = {print("3a")},
"4" = {print("4a")}
)

x <- 10

ifelse(x > 0, "Positive", "Non Positive")
LETTERS
letters
