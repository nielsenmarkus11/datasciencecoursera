## Question 1
setwd("~/GitHub/datasciencecoursera/CleaningData")
library(dplyr)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./data/housing.csv",mode="wb")

housingData <- read.csv("./data/housing.csv",header=T)

strsplit(names(housingData),"wgtp")[123]

# Question 2
gdp <-read.csv("./data/GDP.csv",header=F,skip=5,nrows=190)

gdp <- select(gdp,V1,V2,V4:V6)
names(gdp) <- c("CountryCode","GDPRank","Long.Name","GDP","Code")
mean(as.numeric(gsub(",","",gdp$GDP)),na.rm=T)

grep("^United",gdp$Long.Name)

# Question 4
edu <-read.csv("./data/educational.csv",header=T)
newData <- merge(gdp,edu,by="CountryCode")

length(grep("Fiscal year end: June",newData$Special.Notes))

# Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
sum(format(sampleTimes,"%Y")=="2012")
sum(format(sampleTimes,"%Y%a")=="2012Mon")
