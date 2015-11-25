setwd('~/GitHub/datasciencecoursera/RProgramming/assignment3/')

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
names(outcome)

outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])

source('best.R')

best("TX","heart attack")
best("TX","heart failure")

best("MD","heart attack")
best("MD","pneumonia")

best("BB","heart attack")
best("NY","hert attack")

source('rankhospital.R')

rankhospital("TX","heart failure",4)

rankhospital("MD","heart attack","worst")

rankhospital("MN","heart attack",5000)

source('rankall.R')
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)


