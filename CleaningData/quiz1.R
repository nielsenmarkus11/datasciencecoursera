# Question 1
setwd("~/GitHub/datasciencecoursera/CleaningData")

if(!file.exists("data")) {
  dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./data/housing.csv")

housingData <- read.csv("./data/housing.csv",header=T)

sum(housingData$VAL==24,na.rm=T)

# Question 3
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl2,destfile="./data/natural-gas.xlsx",mode='wb')

library(xlsx)
dat <- read.xlsx("./data/natural-gas.xlsx",sheetIndex=1,header=T,rowIndex=18:23,colIndex=7:15)
sum(dat$Zip*dat$Ext,na.rm=T) 

# Question 4
library(XML)
library(RCurl)
xmlUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xData <- getURL(xmlUrl, ssl.verifypeer = FALSE)
doc <- xmlTreeParse(xData,useInternalNodes=T)
sum(xpathSApply(doc,"//zipcode",xmlValue)=="21231")

# Question 5
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl3,"./data/idaho.csv")

DT <- fread("./data/idaho.csv",header=T)

library(microbenchmark)
mean(DT$pwgtp15,by=DT$SEX)# Doesn't work
rowMeans(DT)[DT$SEX==1];rowMeans(DT)[DT$SEX==2]# Doesn't work

microbenchmark(DT[,mean(pwgtp15),by=SEX],
               {mean(DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15)},
               tapply(DT$pwgtp15,DT$SEX,mean),
               sapply(split(DT$pwgtp15,DT$SEX),mean))

