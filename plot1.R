# this script is intended to be used for generating the plot1 graph for Coursera's Exploratory Data Class

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
png(file = "plot1.png", width = 480, height = 480, units = "px")

# generate the graph
hist(housing_data$Global_active_power, 
     col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()