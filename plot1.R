setwd(".\\Exp")

# define file for input
filename <- "household_power_consumption.txt"

# load data frame defining column classes and NA values
Household_pwr_cons <- read.table(filename,
                                 dec=".",
                                 sep = ";",
                                 header = TRUE,
                                 colClasses = c(rep("character",2), rep("numeric",7)),
                                 na="?")

# Convert Time and Date variables into Date/Time classes
Household_pwr_cons <- transform(Household_pwr_cons,
                                Time = strptime(paste(Household_pwr_cons$Date, Household_pwr_cons$Time), "%d/%m/%Y %H:%M:%S"))
Household_pwr_cons <- transform(Household_pwr_cons, Date = as.Date(Date, "%d/%m/%Y"))

# Subsetting dates from 2007-02-01 to 2007-02-02
Subset_Household_pwr_cons <- subset(Household_pwr_cons, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Generate plot 1
png("plot1.png", width=480, height=480)

hist(Subset_Household_pwr_cons$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
dev.off()

setwd("C:\\Users\\Jonas\\Documents\\R")