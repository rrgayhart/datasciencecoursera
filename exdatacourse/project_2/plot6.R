if (!file.exists("data")){
  dir.create("data")
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url,"data/nei_data.zip", method="curl")
  unzip("data/nei_data.zip", exdir="data/")
}

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#-----------------------------------------------------------------------------------
# Compare emissions from motor vehicle sources in Baltimore City (fips == "24510")
# with emissions from motor vehicle sources in LA County (fips == "06037")
# Which city has seen greater changes over time in motor vehicle emissions?
# construct the plot and save it to a PNG file.

Baltimore <- subset(NEI, fips=="24510")
LACounty <- subset(NEI, fips=="06037")

pattern = "mobile - on-road"
ind <- grep(pattern, SCC$EI.Sector, ignore.case=TRUE) 
sccs <- SCC[ind, 1]

Baltimore <- Baltimore[scci, c("Emissions", "year")]
LACounty <- LACounty[scci, c("Emissions", "year")]

png(filename = "plot6.png")
par(mfcol=c(2,1))

sumsBaltimore <- aggregate(Emissions ~ year, data=Baltimore, sum)
sumsLACounty <- aggregate(Emissions ~ year, data=LACounty, sum)

plot(sumsBaltimore$year, sumsBaltimore$Emissions, type="l", main="Total Motor Vehicle Emissions in Baltimore City", xlab="Year", ylab="Emissions (in tons)")
plot(sumsLACounty$year, sumsLACounty$Emissions, type="l", main="Total Motor Vehicle Emissions in LACounty", xlab="Year", ylab="Emissions (in tons)")

dev.off()

close(NEI)
close(SCC)