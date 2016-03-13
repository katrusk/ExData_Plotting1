## Exploratory Data Analysis
## Project 1 - Plotting Data
## Kathy J. Rusniak
## March 12 2016

## This R script creates the corresponding PNG plot of the same name, which is a
## recreation of the plots provided in the class repo forked for Exploratory Data
## Analysis, Project 1
## Files included in submission: plot1.R, plot1.png, plot2.R, plot2.png, plot3.R,
## plot3.png, plot4.R, plot4.png

# read data into R
# assumes data located in home directory
library(dplyr)
hpc <- tbl_df(read.table("./household_power_consumption.txt", sep = ";", header = TRUE))

# convert Date and Time variables
library(lubridate)
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

# filter out data for 2007-02-01 and 2007-02-02
power <- filter(hpc, Date == "2007-02-01" | Date == "2007-02-02")

# create date+time variable, global as char
date_time <- paste(power$Date, power$Time, sep = " ") %>% 
  strptime(format = "%Y-%m-%d %H:%M:%S")

global <- as.numeric(as.character(power$Global_active_power))

# open png device
png("./plot2.png", width = 480, height = 480, units = "px")

# create graph of date_time and Global_active_power
plot(date_time, global, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# shut off png device
dev.off()