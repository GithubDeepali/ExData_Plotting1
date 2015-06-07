##Subsetting Data

library(sqldf)
householddata3 <- read.csv.sql("./household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",  header = TRUE, sep = ";")

## Combine date and time column
datetime <- strptime(paste(householddata3$Date,householddata3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##Plot date time vs Global active power
plot(datetime, householddata3$Global_active_power, xlab = " ", ylab = "Global Active Power(kilowatt)", type ="l")

## Copt to png File plot2
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")

## Closing the PNG Device
dev.off()