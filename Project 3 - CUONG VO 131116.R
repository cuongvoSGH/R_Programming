# Cuong Vo - 131116

# Algorithms Documentation

integrate3d <- function(f, over, n){
  x <- seq(from = over$x[[1]], to = over$x[[2]], length.out = n) 
  y <- seq(from = over$y[[1]], to = over$y[[2]], length.out = n)
  z <- seq(from = 0, to = pi, length.out = n)
  result = 0
  
  for (i in (1:n)){
    x1 <- sample(x, size = 1)
    y1 <- sample(y, size = 1)
    z1 <- sample(z, size = 1)
    
    z_actual <- f(x1,y1)
    
    if (z1 <= z_actual) result = result + 1
  }
  return(result)
}

debug(fun = integrate3d)
integrate3d(f = function(x, y) { (cos(x) + 2) * (sin(y) + 1)},
            over = list(x = c(0, pi), y = c(0, pi)),
            n = 10^5
            )





