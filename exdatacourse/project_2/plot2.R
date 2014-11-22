if (!file.exists("data")){
  dir.create("data")
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url,"data/nei_data.zip", method="curl")
  unzip("data/nei_data.zip", exdir="data/")
}

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#-----------------------------------------------------------------------------------
# Have total emissions from PM2.5 decreased in the 
# Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

Baltimore <- subset(NEI, fips=="24510")

png(filename = "plot2.png")
par(mfcol=c(2,1))

means <- aggregate(Emissions ~ year, data=Baltimore, mean)
sums <- aggregate(Emissions ~ year, data=Baltimore, sum)

plot(sums$year, sums$Emissions, type="l", main="Total PM2.5 Emissions in Baltimore City", xlab="Year", ylab="Emissions (in tons)")
plot(means$year, means$Emissions, type="l", main="Median Total PM2.5 Emissions in Baltimore City", xlab="Year", ylab="Emissions (in tons)")

dev.off()
close(NEI)
close(SCC)