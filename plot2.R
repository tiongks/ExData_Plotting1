# this script is intended to be used for generating the plot2 graph for Coursera's Exploratory Data Class

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
png(file = "plot2.png")

# plot the global active power against date and time
plot(housing_data[, c("DateTime", "Global_active_power")], type = "l", ylab= "Global Active Power (kilowatts)")

dev.off()