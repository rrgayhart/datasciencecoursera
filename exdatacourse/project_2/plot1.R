if (!file.exists("data")){
  dir.create("data")
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url,"data/nei_data.zip", method="curl")
  unzip("data/nei_data.zip", exdir="data/")
}

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#-----------------------------------------------------------------------------------

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

png(filename = "plot1.png")
par(mfcol=c(2,1))

means <- aggregate(Emissions ~ year, data=NEI, mean)
sums <- aggregate(Emissions ~ year, data=NEI, sum)

plot(sums$year, sums$Emissions, type="l", main="Total PM2.5 Emissions in United States", xlab="Year", ylab="Emissions (in tons)")
plot(means$year, means$Emissions, type="l", main="Median Total PM2.5 Emissions in United States", xlab="Year", ylab="Emissions (in tons)")

dev.off()
close(NEI)
close(SCC)
