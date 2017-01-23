# Chris Schroeder
# Coursera - Exploratory Data Analysis
# Project 1, plot1.R

library(lubridate)
setwd("./ExploratoryDataAnalysis/project1")

house <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";")
house$Date <- dmy(house$Date)
house <- subset(house, house$Date == ymd("2007-02-01") | house$Date == ymd("2007-02-02"))
house$Time <- strptime(house$Time, format = "%T", tz = "")
house$Global_active_power <- as.numeric(house$Global_active_power)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(house$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", breaks = 16)

dev.off()

