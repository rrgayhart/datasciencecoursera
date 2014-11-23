if (!file.exists("data")){
  dir.create("data")
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url,"data/nei_data.zip", method="curl")
  unzip("data/nei_data.zip", exdir="data/")
}

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#-----------------------------------------------------------------------------------
# Across the United States, how have emissions from
# coal combustion-related sources changed from 1999–2008?

png(filename = "plot4.png")
par(mfcol=c(2,1))

pattern = "comb.*coal"
ind <- grep(pattern, SCC$EI.Sector, ignore.case=TRUE) 
sccs <- SCC[ind, 1]
cci <- NEI$SCC %in% sccs
NEIsubset <- NEI[cci, c("Emissions", "year")]

means <- aggregate(Emissions ~ year, data=NEIsubset, mean)
sums <- aggregate(Emissions ~ year, data=NEIsubset, sum)

plot(sums$year, sums$Emissions, type="l", main="Total Coal Combustion Emissions in United States", xlab="Year", ylab="Emissions (in tons)")
plot(means$year, means$Emissions, type="l", main="Mean Total Coal Combustion Emissions in United States", xlab="Year", ylab="Emissions (in tons)")

dev.off()

# NEI contains
# fips: A five-digit number (represented as a string) indicating the U.S. county
# SCC: The name of the source as indicated by a digit string (see source code classification table)
# Pollutant: A string indicating the pollutant
# Emissions: Amount of PM2.5 emitted, in tons
# type: The type of source (point, non-point, on-road, or non-road)
# year: The year of emissions recorded




close(NEI)
close(SCC)