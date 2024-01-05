maze <- readRDS(file = "./Project/maze.RDS")
endPosition  <- list(x = 387:413, y = 322:348)
startPoint <- list(x = 1, y =1)

pathQ <- function(maze, startPoint, endRegion){
  direction <- list(x = c(-1,1,0,0), y = c(0,0,-1,1)) 
  count_var <- 1
  track_path <- maze
  move_line_x <- c()
  move_line_y <- c()
  m <- dim(maze)[1]
  n <- dim(maze)[2]
  u <- startPoint$x
  v <- startPoint$y
  track_path[u,v] <- FALSE
  move_line_x <- c(move_line_x, u)
  move_line_y <- c(move_line_y, v)
  
  while (length(move_line_x) >= count_var){
    u <- move_line_x[count_var]
    v <- move_line_y[count_var]
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
    count_var <- count_var + 1
  }
  
  for (i in endRegion$x){
    for (j in endRegion$y){
      if (track_path[i,j] == FALSE && maze[i,j] == TRUE) return(TRUE)
    }
  }
  return(FALSE)
}

debug(fun = pathQ)
start_time <- Sys.time()
pathQ(d0, startPoint = startPoint, endRegion = endPosition)
end_time <- Sys.time()
print(end_time - start_time)
