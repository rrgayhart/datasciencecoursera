datasets <- read.csv('hw1_data.csv')

splitIt <- function() {
  s <- split(datasets, datasets$Month)
}

takeL <- function() {
  lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
}

takeS <- function() {
  sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
}