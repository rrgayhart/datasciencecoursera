if (!file.exists("data")){
  dir.create("data")
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url,"data/nei_data.zip", method="curl")
  unzip("data/nei_data.zip", exdir="data/")
}

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#-----------------------------------------------------------------------------------
# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City (fips == "24510")?
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system

library(ggplot2)

# Limit the years to 1999-2008
# Limit the scope to Baltimore county
TDF <- subset(NEI, fips=="24510")

# factor of type

g <- ggplot(TDF, aes(year, Emissions, color=factor(type))) + geom_point() + ggtitle('Emissions for Baltimore County by Type') +facet_wrap(~type, nrow=1)

g <- g+labs(x="Year", y=expression(paste("Emissions of PM2.5 (tons)")))

g

ggsave(file="plot3.png")

dev.off()

close(NEI)
close(SCC)