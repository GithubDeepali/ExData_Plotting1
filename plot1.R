##Installing the sqldf library
library(sqldf)

## Subsetting the filtered data for particular dates using sql query
householddata3 <- read.csv.sql("./household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",  header = TRUE, sep = ";")

library(datasets)

## Creating png File
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## Plot 1
hist(householddata3$Global_active_power, xlab = "Golbal Active Power(kilowatt)", ylab = "Frequency", main = "Global Active Power", col = "Red")

## Closing the connection
dev.off()