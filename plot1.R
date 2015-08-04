# Script for PLOT 1, Course Project 1 - Exploratory Data Analysis
# by Yamila Omar - 4th August 2015

# Load the data. The number of rows was chosen to include the needed days, but
# not more.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings = "?", nrows= 69517, stringsAsFactors=FALSE)

# Change the class of the "Date" column to date.
library(lubridate)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the desired dates
library(dplyr)
target_data <- filter(data, Date >= as.Date("2007-02-01"), 
                      Date <= as.Date("2007-02-02"))
remove(data)

# Make the desired graph
png(file = "plot1.png")
hist(target_data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()