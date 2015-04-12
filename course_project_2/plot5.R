library(ggplot2)

# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999-2008 in
# Baltimore City?

# Get Baltimore emissions from motor vehicle sources
BmoreEmissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
BmoreEmissionsYear <- aggregate(Emissions ~ year, data=BmoreEmissions, FUN=sum)

# Generate plot 5
png("plot5.png")
ggplot(BmoreEmissionsYear, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission")) +
  ggtitle("emission from motor vehicle sources in Baltimore City")
dev.off()