library(ggplot2)

# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999 to 2008?

# Coal combustion-related sources
USCombustionCoal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
USCombustionCoalSources <- SCC[USCombustionCoal,]

# Find emission from coal combustion-related sources
Emissions <- NEI[(NEI$SCC %in% USCombustionCoalSources$SCC), ]

# group by year
EmissionsYears <- aggregate(Emissions ~ year, data=Emissions, FUN=sum)

# Generate plot 4
png("plot4.png")
ggplot(EmissionsYears, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission")) +
  ggtitle("emission from coal combustion-related sources")
dev.off()