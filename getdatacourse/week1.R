library(data.table)
if (!file.exists("data")) {
  dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "getdata.csv", method = "curl")
dateDownloaded <- date()
microdata <- read.table("./getdata.csv", sep = ",", header = TRUE)
DT = data.frame(microdata)
s <- subset(DT, VAL > 23)
max(DT$VAL, na.rm=TRUE)
#53 - internally consistant

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "getdata2.xlsx", method = "curl")
dateDownloaded <- date()
microdata <- read.xlsx("./getdata.csv", sheetIndex=1, header = TRUE)
DT = data.frame(microdata)
