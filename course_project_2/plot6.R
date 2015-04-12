library(ggplot2)

# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips ==
# "06037"). Which city has seen greater changes over time in motor vehicle
# emissions?

# Get Baltimore emissions from motor vehicle sources
BmoreEmissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
BmoreEmissionsYear <- aggregate(Emissions ~ year, BmoreEmissions, sum)

# Get Los Angeles emissions from motor vehicle sources
LaEmissions <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
LaEmissionsYear <- aggregate(Emissions ~ year, LaEmissions, sum)

BmoreEmissionsYear$County <- "Baltimore City, MD"
LaEmissionsYear$County <- "Los Angeles County, CA"
BothEmissions <- rbind(BmoreEmissionsYear, LaEmissionsYear)

# Generate plot 6
png("plot6.png")
ggplot(BothEmissions, aes(x=factor(year), y=Emissions, fill=County)) +
  geom_bar(stat="identity") + 
  facet_grid(County  ~ ., scales="free") +
  ylab("total emissions (tons)") + 
  xlab("year") +
  ggtitle(expression("Motor vehicle emission variation\nin Baltimore and Los Angeles"))
dev.off()