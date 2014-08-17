##source("corr.R")
##source("complete.R")
corr <- function(directory, threshold = 0) {
  corrsNum <- numeric(0)

  completeData <- complete(directory)
  nobsDfr <- completeData[completeData$nobs > threshold, ]
  
  filenames <- list.files(directory, full.names=TRUE)
  
  for (cid in nobsDfr$id) {
    monDfr <- read.csv(filenames[cid])
    corrsNum <- c(corrsNum, cor(monDfr$sulfate, monDfr$nitrate, use = "pairwise.complete.obs"))
  }
  return(corrsNum)
}
