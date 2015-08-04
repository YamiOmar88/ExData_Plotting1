# Script for PLOT 2, Course Project 1 - Exploratory Data Analysis
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

# Make a new column of time and date all together
target_data$Date_and_Time <- paste(as.character(target_data$Date), target_data$Time)
target_data$Date_and_Time <- strptime(target_data$Date_and_Time, format = "%Y-%m-%d %H:%M:%S")


# Make the desired graph
png(file = "plot2.png")
with(target_data, plot(Date_and_Time, Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()