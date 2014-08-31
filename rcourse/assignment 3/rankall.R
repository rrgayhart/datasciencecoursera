rankall <- function(outcome, num="best") {
  source('rankhospital.R')
  dataFrame <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- unique(dataFrame$State)
  numstate <- length(states)
  rankings <- data.frame(hospital=NULL, state=NULL, value=NULL)
  for (i in seq(states)) {
    state <- states[i]
    rankings <- rbind(rankings, data.frame(hospital=rankhospital(state, outcome, num), state=state))
  }
  rankings
}