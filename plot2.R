# Chris Schroeder
# Coursera - Exploratory Data Analysis
# Project 1, plot2.R

library(lubridate)
setwd("./ExploratoryDataAnalysis/project1")

house <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
house$datetime <- with(house, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
house$Date <- dmy(house$Date)
house <- subset(house, house$Date == ymd("2007-02-01") | house$Date == ymd("2007-02-02"))
house$Global_active_power <- as.numeric(house$Global_active_power)

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(house$datetime, house$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()