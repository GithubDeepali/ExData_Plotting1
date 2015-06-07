##Subsetting Data

library(sqldf)
householddata3 <- read.csv.sql("./household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",  header = TRUE, sep = ";")

## Combine date and time column
datetime <- strptime(paste(householddata3$Date,householddata3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##Plot 3
with(householddata3, plot(datetime, Sub_metering_1, xlab = " ", ylab = "Energy sub metering", type = "l"))plot(datetime, householddata3$Global_active_power, xlab = " ", ylab = "Global Active Power(kilowatt)", type ="l")
lines(datetime, householddata3$Sub_metering_2, type = "l", col ="RED")
lines(datetime, householddata3$Sub_metering_3, type = "l", col ="BLUE")

##adding the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("BLACK", "RED", "BLUE"), lty = 1, lwd = 1)

## Copy to png File plot3
dev.copy(png, file = "plot3.png", width = 600, height = 480, units = "px")

## Closing the PNG Device
dev.off()