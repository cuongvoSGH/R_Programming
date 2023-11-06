# Cuong Vo - 131116

# Algorithms Documentation

# Cleaning
library(magick)
# Read the image
d0 <- image_read(path = "./wallpaper.png")
# Get only the relevant part
dims <- rev(dim(as.raster(d0)))
d1 <- image_crop(image = d0, geometry = "800x800+560+140")
# Quantifying
d2 <- as.raster(image_quantize(image_normalize(d1), max = 2))
# Changing to TRUE / FALSE matrix
d3 <- array(
  ifelse(as.vector(d2) == unique(as.vector(d2))[1], TRUE, FALSE),
  dim(d2)
)
# Saving
saveRDS(object = d3, file = "./maze.RDS")
# Reading in the maze
d0 <- readRDS(file = "./maze.RDS")

# Finding Path
endPosition  <- list(x = 220:230, y = 325:335)
startPoint <- list(x = 1, y =1)

pathQ <- function(maze, startPoint, endRegion){
  direction <- list(x = c(-1,1,0,0), y = c(0,0,-1,1)) 
  track_path <- d0
  move_line_x <- c()
  move_line_y <- c()
  m <- dim(d0)[1]
  n <- dim(d0)[2]
  u <- startPoint$x
  v <- startPoint$y
  track_path[u,v] <- FALSE
  move_line_x <- c(move_line_x, u)
  move_line_y <- c(move_line_y, v)
  
  while (length(move_line_x) > 0){
    u <- move_line_x[1]
    v <- move_line_y[1]
    for (k in c(1:4)){
      u <- u + direction$x[k]
      v <- v + direction$y[k]
      if ((u>0) && (v>0) && (u<=m) && (v<=n) && (track_path[u,v] == TRUE)){
        move_line_x <- c(move_line_x,u)
        move_line_y <- c(move_line_y,v)
        track_path[u,v] = FALSE
        u <- u - direction$x[k]
        v <- v - direction$y[k]
      } else {
        u <- u - direction$x[k]
        v <- v - direction$y[k]
      }
    }
    move_line_x <- move_line_x[-1]
    move_line_y <- move_line_y[-1]
  }
  
  for (i in endRegion$x){
    for (j in endRegion$y){
      if (track_path[i,j] == FALSE && d0[i,j] == TRUE) return(TRUE)
    }
  }
  return(FALSE)
}

pathQ(d0, startPoint = startPoint, endRegion = endPosition)
