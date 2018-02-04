# this script is intended to be used for generating the plot4 graph for Coursera's Exploratory Data Class

# include the function for reading data
source("read_data.R")

# for efficiency's sake, we will be using cached data, in order to force re-reading data from the csv
# file, set force_refresh to TRUE
force_refresh <- FALSE

# get the filtered data
if (force_refresh || !exists("housing_data") || is.na(housing_data) || is.null(housing_data)) {
  housing_data <- read_housing_data()
}

# save the graph to a png file
png(file = "plot4.png")

# set the display to 2 rows and 2 columns
par(mfrow = c(2, 2))

# plot the global active power against date and time
plot(housing_data[, c("DateTime", "Global_active_power")], type = "l", ylab= "Global Active Power")

# render the voltage graph
plot(housing_data[, c("DateTime", "Voltage")], type = "l")

# render the graphs
plot(housing_data[,c("DateTime", "Sub_metering_1")], type = "l", ylab = "Energy sub metering")
lines(housing_data[,c("DateTime", "Sub_metering_2")], type = "l", col = "red")
lines(housing_data[,c("DateTime", "Sub_metering_3")], type = "l", col = "blue")
legend("topright", pch= 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# render the global reactive power graph
plot(housing_data[, c("DateTime", "Global_reactive_power")], type = "l")

dev.off()
