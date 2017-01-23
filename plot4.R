# Chris Schroeder
# Coursera - Exploratory Data Analysis
# Project 1, plot4.R

library(lubridate)
setwd("./ExploratoryDataAnalysis/project1")

house <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
house$datetime <- with(house, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
house$Date <- dmy(house$Date)
house <- subset(house, house$Date == ymd("2007-02-01") | house$Date == ymd("2007-02-02"))
house$Global_active_power <- as.numeric(house$Global_active_power)


png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfrow = c(2,2), pty = "s", mar = c(4,3,1,2))

plot(house$datetime, house$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(house$datetime, house$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(house$datetime, house$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(house$datetime, house$Sub_metering_2, col = "red")
lines(house$datetime, house$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))


plot(house$datetime, house$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()


