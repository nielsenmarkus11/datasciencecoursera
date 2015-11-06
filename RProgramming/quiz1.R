myDat <- read.csv("~/GitHub/datasciencecoursera/RProgramming/data/hw1_data.csv",header=T)

head(myDat,2)
dim(myDat)
tail(myDat,2)
myDat[47,]
sum(is.na(myDat$Ozone))
mean(myDat$Ozone,na.rm=T)
mean(myDat$Solar.R[myDat$Ozone>31 & myDat$Temp>90],na.rm=T)
mean(myDat$Temp[myDat$Month==6],na.rm=T)
max(myDat$Ozone[myDat$Month==5],na.rm=T)
