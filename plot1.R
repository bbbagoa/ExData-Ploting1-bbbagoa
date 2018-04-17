
#####  -------------  Exploratory Data Analysis - Assign 1
#                     Brice Baem BAGOA (baembrice@gmail.com)
#### ------------------------------------------------------------

## My Home directory
setwd("C:\\Users\\Dell\\Documents\\Learning\\Data Science Specialization\\Exploratory Data Analysis\\eda1-repo")

#######  ------------------------ Data Preparation

## read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
head(data)

dim(data)

## Convert dates to the right format
dates <- sapply(data$Date, toString) 
cv_dates <- as.Date(dates, format = "%d/%m/%Y")
data <- data.frame(data, cv_dates)

## Split the file
use_data <- data[(data$cv_dates >= "2007-02-01") & (data$cv_dates <= "2007-02-02"),]
rm(data) ## free some memory !

## Create the DateTime variable
dates <- sapply(use_data$Date, toString) ## new dates from the new dataset
times <- sapply(use_data$Time, toString) ## Convert times to string

date_time <- strptime(paste(dates, times), format = "%d/%m/%Y %T")

## final dataset to use
use_data <- data.frame(use_data, date_time)

#######  ------------------------ Plot 1

png("plot1.png",width = 480, height = 480) ##  Open png file


## make my plot
hist(use_data$Global_active_power,
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active power (Kilowatts)")

dev.off() ## Close png

