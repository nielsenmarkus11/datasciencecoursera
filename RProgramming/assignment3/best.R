best <- function(state, outcome) {
  ## Read outcome data
  dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  ## Check that state and outcome are valid
  if(!(state %in% unique(dat$State))){
    stop('invalid state')
  }
  if(!(outcome %in% c("heart attack","heart failure","pneumonia"))){
    stop('invalid outcome')
  }
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  dat2 <- dat[dat$State==state,]
  if(outcome=="heart attack"){
    dat2$Hospital.Name[order(as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),dat2$Hospital.Name,na.last=T)][1]
  } else if(outcome=="heart failure"){
    dat2$Hospital.Name[order(as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),dat2$Hospital.Name,na.last=T)][1]
  } else {
    dat2$Hospital.Name[order(as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),dat2$Hospital.Name,na.last=T)][1]
  }
}