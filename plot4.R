##Subsetting Data

library(sqldf)
householddata3 <- read.csv.sql("./household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",  header = TRUE, sep = ";")

## Combine date and time column
datetime <- strptime(paste(householddata3$Date,householddata3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##Plot 4
par(mfrow = c(2,2))
plot(datetime, householddata3$Global_active_power, xlab = " ", ylab = "Global Active Power(kilowatt)", type ="l")
plot(datetime, householddata3$Voltage, xlab = "datetime", ylab = "Voltage", type ="l")
plot(datetime, householddata3$Sub_metering_1, xlab = " ", ylab = "Energy sub metering", type = "l")
lines(datetime, householddata3$Sub_metering_2, type = "l", col ="RED")
lines(datetime, householddata3$Sub_metering_3, type = "l", col ="BLUE")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("BLACK", "RED", "BLUE"), lty = 0.5, lwd = 0.5)
plot(datetime, householddata3$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type ="l")

## Copy to png File plot3
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")

## Closing the PNG Device
dev.off()