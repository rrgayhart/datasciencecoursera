pollutantmean <- function(directory, pollutant, id = 1:332) {
  filenames <- list.files(directory, full.names=TRUE)
  alldata <- data.frame()
  for (i in id) {
    alldata <- rbind(alldata, read.csv(filenames[i]))
  }
  pollutantdata <- alldata[which(alldata[,"ID"] >= min(id) & alldata[,"ID"] <= max(id)), pollutant]
  mean(pollutantdata, na.rm = TRUE)
}