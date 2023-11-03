d <- data.frame(
  id = 1:5,
  value = rnorm(5),
  class = sample(LETTERS[1:2], size = 5, replace = TRUE)
)

as.list(d)

as.data.frame(as.list(d))

d <- read.csv("data_2.csv", header = TRUE)
class(d)

dim(d)
names(d)
str(d)
summary(d)
head(d)
tail(d)

setwd('D:/01. W 2023 2024/Basic R Programming')
d <- data.frame(
  id = 1:5,
  values = rnorm(5),
  class = sample(LETTERS[1:2], size = 5, replace = TRUE)
)

write.csv(d, 'data_00.csv', row.names = FALSE)
write.csv2(D, 'data_00.csv', row.names = FALSE) # --> replace "," by ";"

d[d$values > 0, c("values", "class")]

