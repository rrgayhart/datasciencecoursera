map_outcome <- function(outcome) {
  short <- c('heart attack', 'heart failure', 'pneumonia')
  long <- c('Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack', 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure', 'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia')
  d <- data.frame(short, long, stringsAsFactors=FALSE)
  d[d$short == outcome, 'long']
}

best <- function(state, outcome) {
  hosp_data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  row_name <- map_outcome(outcome)
  hospitals_in_state <- hosp_data[hosp_data$State == state,]
  clean <- hospitals_in_state[hospitals_in_state[[row_name]] != "Not Available",]
  min_value <- min(clean[[row_name]])
  answer <- clean[clean[[row_name]] == min_value,]
  min(answer$Hospital.Name)
}