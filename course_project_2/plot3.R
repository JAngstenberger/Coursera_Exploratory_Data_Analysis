library(ggplot2)

# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999-2008 for Baltimore City? Which have seen increases in
# emissions from 1999-2008?
BmoreEmissions <- NEI[NEI$fips=="24510",]

# Group emissions by year
BmoreEmissionsYearType <- aggregate(Emissions ~ year + type, BmoreEmissions, sum)

# Generate Plot 3
png('plot3.png', height=480, width=880)
ggplot(BmoreEmissionsYearType, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore City by year and source type", sep="")))
dev.off()