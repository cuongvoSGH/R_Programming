# Cuong Vo - 131116

# Algorithms Documentation

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

integrate3d(f = function(x, y) {cos(x) * y},
            over = list(x = c(0, pi / 2), y = c(0, 1)),
            n = 10^5
            )