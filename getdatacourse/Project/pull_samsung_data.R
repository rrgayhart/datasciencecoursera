if (!file.exists("data")) {
  dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/samsung.zip", method="curl")
dateDownloaded <- date()
unzip('./data/samsung.zip', exdir="./data")