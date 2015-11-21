# Subsetting and Sorting

library(plyr)
data(iris)

x<-arrange(iris,Sepal.Length)
head(x)

# Summarizing Data

head(iris)
tail(iris)
summary(iris)
str(iris)
quantile(iris$Sepal.Length,probs=c(.5,.75,.99))
table(iris$Species)

# Check for missing values
any(is.na(iris$Sepal.Length))
all(iris$Sepal.Width>1)

# Row and Column Sums
colSums(iris[,-5])


# Cross tabs
data(UCBAdmissions)
DF <- as.data.frame(UCBAdmissions)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt

warpbreaks$replicate <- rep(1:9, len=54)
xt <- xtabs(breaks~.,data=warpbreaks)
xt


fakeData <- rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")

## Create new variables
# Sequences
x <- c(1,35,75,999)
seq(along=x)

# create categorical variables
iris$Sepal.Width.Bin <- cut(iris$Sepal.Width,breaks=quantile(iris$Sepal.Width))
iris$Sepal.Width.Bin

library(Hmisc)
iris$Sepal.Width.Bin2 <-cut2(iris$Sepal.Width,g=4)
iris$Sepal.Width.Bin2
# the <NA> valued disappeared with this function

#mutate
iris2 <- mutate(iris,SW.Grp=cut2(iris$Sepal.Width,g=4))
head(iris2)


## Reshape data
library(reshape2)
head(mtcars)

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt)

cylData <- dcast(carMelt, cyl~variable,mean)
cylData

head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

library(plyr)
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=sum(count))
#this doesn't work

## dplyr package
select()
mutate()
group_by()
summarize()
# these are fast "distilled" plyr
# they can be piped together.

## Merging Data
merge(x,y,by.x,by.y,all=T)
# all=T is to do a full outer join

#plyr
join(df1,df2)
join_all(list(df1,df2,df3))

