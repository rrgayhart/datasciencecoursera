complete <- function(directory, id = 1:332) {
  filenames <- list.files(directory, full.names=TRUE)
  response <- data.frame(id=numeric(0), nobs=numeric(0))
  for (i in id) {
    data <- read.csv(filenames[i])
    response <- rbind(response, data.frame(id=i, nobs=sum(complete.cases(data))))
  }
  response
}