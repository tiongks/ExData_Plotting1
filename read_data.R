# custom class for reading date variables in CSV files
setClass("dmyDate")
setAs("character", "dmyDate", function(from) as.Date(from, "%d/%m/%Y"))
setClass("cNumeric")
setAs("character", "cNumeric", function(from) as.numeric(from))

# function for reading data, this function is going to be used in all plotting exercises
read_housing_data <- function(filename = "household_power_consumption.txt") {
  h <- read.csv2(filename, colClasses = c("dmyDate", NA, "cNumeric", "cNumeric", "cNumeric", 
                                          "cNumeric", "cNumeric", "cNumeric", "cNumeric"))
  
  # we are only interested in a subset of the data, let us conserve memory
  hfiltered <- h[h$Date >= as.Date("02/01/2007", "%m/%d/%Y") & h$Date <= as.Date("02/02/2007", "%m/%d/%Y"),]
  
  # add the date and time column for convenience' sake
  hfiltered$DateTime <- as.POSIXct(paste(hfiltered$Date, hfiltered$Time))
  hfiltered
}