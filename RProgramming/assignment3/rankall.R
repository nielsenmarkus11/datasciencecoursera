rankall <- function(outcome, num="best") {
  ## Read outcome data
  dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  ## Check that state and outcome are valid
  if(!(outcome %in% c("heart attack","heart failure","pneumonia"))){
    stop('invalid outcome')
  }
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  allrank <- NULL
  for(state in sort(unique(dat$State))){
    dat2 <- dat[dat$State==state,]
    if(num=="best"){
      if(outcome=="heart attack"){
        temp <- data.frame(hospital=dat2$Hospital.Name[order(as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),dat2$Hospital.Name,na.last=T)][1],state=state)
        allrank <- rbind(allrank,temp)
      } else if(outcome=="heart failure"){
        temp <- data.frame(hospital=dat2$Hospital.Name[order(as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),dat2$Hospital.Name,na.last=T)][1],state=state)
        allrank <- rbind(allrank,temp)
      } else {
        temp <- data.frame(hospital=dat2$Hospital.Name[order(as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),dat2$Hospital.Name,na.last=T)][1],state=state)
        allrank <- rbind(allrank,temp)
      }
    }
    else if(num=="worst"){
      if(outcome=="heart attack"){
        temp <- data.frame(hospital=dat2$Hospital.Name[order(-as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),dat2$Hospital.Name,na.last=T)][1],state=state)
        allrank <- rbind(allrank,temp)
      } else if(outcome=="heart failure"){
        temp <- data.frame(hospital=dat2$Hospital.Name[order(-as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),dat2$Hospital.Name,na.last=T)][1],state=state)
        allrank <- rbind(allrank,temp)
      } else {
        temp <- data.frame(hospital=dat2$Hospital.Name[order(-as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),dat2$Hospital.Name,na.last=T)][1],state=state)
        allrank <- rbind(allrank,temp)
      }
    }
    else {
      if(outcome=="heart attack"){
        temp <- data.frame(hospital=dat2$Hospital.Name[order(as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),dat2$Hospital.Name,na.last=T)][num],state=state)
        allrank <- rbind(allrank,temp)
      } else if(outcome=="heart failure"){
        temp <- data.frame(hospital=dat2$Hospital.Name[order(as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),dat2$Hospital.Name,na.last=T)][num],state=state)
        allrank <- rbind(allrank,temp)
      } else {
        temp <- data.frame(hospital=dat2$Hospital.Name[order(as.numeric(dat2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),dat2$Hospital.Name,na.last=T)][num],state=state)
        allrank <- rbind(allrank,temp)
      }
    }
  }
  return(allrank)
}