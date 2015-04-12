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
                                Time = strptime(paste(Household_pwr_cons$Date, Household_pwr_cons$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT"))
Household_pwr_cons <- transform(Household_pwr_cons, Date = as.Date(Date, "%d/%m/%Y"))

# Subsetting dates from 2007-02-01 to 2007-02-02
Subset_Household_pwr_cons <- subset(Household_pwr_cons, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Generate plot 3

png("plot3.png", width=480, height=480)

plot(Subset_Household_pwr_cons$Time,
     Subset_Household_pwr_cons$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")
lines(Subset_Household_pwr_cons$Time,
      Subset_Household_pwr_cons$Sub_metering_2,
      col="red")
lines(Subset_Household_pwr_cons$Time,
      Subset_Household_pwr_cons$Sub_metering_3,
      col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)
dev.off()