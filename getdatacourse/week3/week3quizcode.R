fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl, destfile = "./cdata.csv", method="curl")
dt <- read.csv("cdata.csv")
agricultureLogical <- dt[which(dt$ACR >= 3 & dt$AGS >= 6),]
agricultureLogical <- dt[which(dt$ACR %in% c(3) & dt$AGS %in% c(6)),]

library(jpeg)
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
download.file(fileUrl, destfile="data.jpg", method="curl")
dt <- readJPEG("data.jpg", native=TRUE)
quantile(dt, probs=c(0.8, 0.3), native=TRUE)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./GDPdata.csv", method="curl")
GDP <- read.csv("GDPdata.csv")

nextFileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(nextFileUrl, destfile = "./eddata.csv", method="curl")
eddata <- read.csv("eddata.csv")

mergedData = merge(GDP, eddata,by.x="X",by.y="CountryCode",all=TRUE)