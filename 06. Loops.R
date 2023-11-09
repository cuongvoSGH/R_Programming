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


