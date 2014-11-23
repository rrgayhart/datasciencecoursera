if (!file.exists("data")){
  dir.create("data")
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url,"data/nei_data.zip", method="curl")
  unzip("data/nei_data.zip", exdir="data/")
}

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#-----------------------------------------------------------------------------------
# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City  (fips == "24510")?

Baltimore <- subset(NEI, fips=="24510")

png(filename = "plot5.png")
par(mfcol=c(2,1))

pattern = "mobile - on-road"
ind <- grep(pattern, SCC$EI.Sector, ignore.case=TRUE) 
sccs <- SCC[ind, 1]

scci <- Baltimore$SCC %in% sccs

Baltimore <- Baltimore[scci, c("Emissions", "year")]

sums <- aggregate(Emissions ~ year, data=Baltimore, sum)
means <- aggregate(Emissions ~ year, data=Baltimore, mean)

plot(sums$year, sums$Emissions, type="l", main="Total Motor Vehicle Emissions in Baltimore City", xlab="Year", ylab="Emissions (in tons)")
plot(means$year, means$Emissions, type="l", main="Total Mean Motor Vehicle Emissions in Baltimore City", xlab="Year", ylab="Emissions (in tons)")

dev.off()

close(NEI)
close(SCC)