## Question 1
setwd("~/GitHub/datasciencecoursera/CleaningData")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./data/housing.csv",mode="wb")

housingData <- read.csv("./data/housing.csv",header=T)

library(dplyr)

hd2 <- mutate(housingData,agricultureLogical=(ACR==3 & AGS==6))
which(hd2$agricultureLogical)

# Question 2
library(jpeg)
imgUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(imgUrl,destfile = "./data/jeff.jpg",mode="wb")
myjpg <- readJPEG("./data/jeff.jpg",native=T)
quantile(myjpg,probs=c(.3,.8))

# Question 3
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url1,destfile = "./data/GDP.csv",mode="wb")
download.file(url2,destfile = "./data/educational.csv",mode="wb")

gdp <-read.csv("./data/GDP.csv",header=F,skip=5,nrows=190)
edu <-read.csv("./data/educational.csv",header=T)

head(gdp)
gdp <- select(gdp,V1,V2,V4:V6)
head(gdp)
summary(gdp)
head(names(edu))
names(gdp) <- c("CountryCode","GDPRank","Long.Name","GDP","Code")

newData <- merge(gdp,edu,by="CountryCode")
newData <- arrange(newData,desc(GDPRank))
dim(newData)
tail(head(newData,n=13),n=1)

# Question 4
library(Hmisc)
summary(newData)
group_by(newData,Income.Group) %>% summarize(RankMean=mean(GDPRank))

dat <- select(newData,GDPRank,Income.Group) %>% mutate(quants=cut2(GDPRank,g=5)) %>% group_by(Income.Group)
xtabs(~ quants+Income.Group ,data=dat)
