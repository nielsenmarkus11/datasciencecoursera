# Question 1
install.packages("httr")
library(httr)

oauth_endpoints("github")

myapp <- oauth_app("github",
                   key = "94a0ed7813f72e802ff7",
                   secret = "d77b95c019f9123c175f6b3b2f2e3565bd03a78b")


github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken, query = list(name="datasharing"))
stop_for_status(req)
json1 <- content(req)

library(jsonlite)

finally <- fromJSON(toJSON(json1))
finally$created_at[finally$name=="datasharing"]

# Question 4
url <-"http://biostat.jhsph.edu/~jleek/contact.html"

con = url(url)
htmlcode = readLines(con)
close(con)
sapply(htmlcode,nchar)[c(10,20,30,100)]

# Question 5
dat5 <- read.fwf("~/GitHub/datasciencecoursera/CleaningData/data/getdata-wksst8110.for",
         skip=4,
         widths = c(12,7,4,9,4,9,4,9,4))
sum(as.numeric(dat5[,4]))
