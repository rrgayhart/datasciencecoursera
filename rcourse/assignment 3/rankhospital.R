rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  dataFrame <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

  dummyMatrix <- as.matrix(dataFrame)
  dummyMatrix[dummyMatrix=="Not Available"] <- NA
  dataFrame <- as.data.frame(dummyMatrix)
  
  names(dataFrame) <- tolower(gsub("[.]", "", names(dataFrame)))
  outcome <- tolower(paste("Hospital30DayDeathMortalityRatesfrom", gsub(" ", "", outcome), sep=""))
  
  ## Check that state and outcome are valid
  if(state %in% dataFrame$state) {
    if(outcome %in% names(dataFrame)) {
      ## Return hospital name in that state with lowest 30-day death rate
      dataFrame <- dataFrame[dataFrame$state == state, ]
      dataFrame <- na.omit(dataFrame[c("hospitalname", outcome)])
      
      dataFrame[,2] <- as.numeric(as.character(dataFrame[,2])) 
      
      dataFrame <- dataFrame[order(dataFrame[outcome], dataFrame["hospitalname"]), ]
      if (num=='best') 
        parsed_num <- 1
      else if (num=='worst')
        parsed_num <- length(dataFrame$hospitalname)
      else
        parsed_num <- num
      
      as.character(dataFrame$hospitalname[parsed_num])
    }
    else {
      stop("invalid outcome")
    }   
  }
  else {
    stop("invalid state")
  }
}