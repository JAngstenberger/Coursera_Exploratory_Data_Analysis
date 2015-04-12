# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Aggregate and calculate sum
TotalEmissions <- aggregate(Emissions ~ year, NEI, sum)

# Create plot1
png('plot1.png')
barplot(height=TotalEmissions$Emissions,
        names.arg=total.emissions$year,
        xlab="years",
        ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions at various years'))
dev.off()