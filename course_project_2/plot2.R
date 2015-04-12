# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in Baltimore City, Maryland from
# 1999 to 2008?
BmoreEmissions <- NEI[NEI$fips=="24510",]

# Group emissions by year
BmoreEmissionsYear <- aggregate(Emissions ~ year, BmoreEmissions, sum)

# Generate Plot 2
png('plot2.png')
barplot(height=BmoreEmissionsYear$Emissions,
        names.arg=BmoreEmissionsYear$year,
        xlab="years",
        ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions in Baltimore City, '*'Maryland from 1999 to 2008'))
dev.off()