# Cuong Vo - 131116

# Algorithms Documentation
# Step 1:
#   Base on the over parameter, generate vector contain up to 10^4 elements for both x and y axis
#   Base on x, y vector, using seq() function randomly pick n point from both x and y and store it into x1 and y1 vector 
# Step 2:
#   Create z_actual vector by using function f calculating n points in x1, y1 vector
#   Base on limit of x, y and min max of z actual, create z vector contain up to 10^4 point
#   Create z1 vector by randomly pick n points from z vector
# Step 3:
#   Compare between each point (x1, y1, z_actual) and (x1, y1, z1). If z1 < z_actual then that point is under the chart
#   The result will be the {number of point below chart} divided by n and multiply by Volume of the region (height x width x long)

integrate3d <- function(f, over, n){
  x <- seq(from = over$x[[1]], to = over$x[[2]], length.out = if (n > 10^4) {10^4} else {n}) 
  y <- seq(from = over$y[[1]], to = over$y[[2]], length.out = if (n > 10^4) {10^4} else {n})
  x1 <- sample(x, size = n, replace = TRUE)
  y1 <- sample(y, size = n, replace = TRUE)
  z_actual <- f(x1,y1)
  z_min <- min(z_actual)
  z_min <- min(z_min, over$x[[1]], over$y[[1]])
  z_max <- max(z_actual)
  z_max <- max(z_max, over$x[[2]], over$y[[2]])
  z <- seq(from = z_min, to = z_max, length.out = if (n > 10^4) {10^4} else {n}) 
  z1 <- sample(z, size = n, replace = TRUE)
  
  
  z_actual <- z_actual - z1
  result <- length(z_actual[z_actual >= 0])
  return(result / n * (over$x[[2]] - over$x[[1]]) * (over$y[[2]] - over$y[[1]]) * (z_max - z_min))
}

# Example 1
integrate3d(
  f = function(x, y) {cos(x) * y},
  over = list(x = c(0, pi / 2), y = c(0, 1)),
  n = 10^5)

# Example 2
integrate3d(
  f = function(x, y) { (cos(x) + 2) * (sin(y) + 1)},
  over = list(x = c(0, pi), y = c(0, pi)),
  n = 10^5)