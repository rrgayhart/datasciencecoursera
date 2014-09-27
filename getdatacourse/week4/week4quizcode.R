fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl, destfile = "./cdata.csv", method="curl")
dt <- read.csv("cdata.csv")
strsplit(names(dt), 'wgtp')[[123]]

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(fileUrl, destfile = "./ddata.csv", method="curl")
dt <- read.csv("ddata.csv")
gdps <- dt$X.3[5:194]
cleangdps <- gsub(",","", gdps)
mean(as.numeric(cleangdps))

library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
table(format(sampleTimes, "%Y") == '2012')
table(weekdays(sampleTimes) == 'Monday' & format(sampleTimes, "%Y") == '2012')
