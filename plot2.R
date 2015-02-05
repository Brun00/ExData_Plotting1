#Script to create plot1 for Exploratory Data Analysis course, Project 1
#load data into data.frame from the suppored file "household_power_consumption.txt" 
dir <- "household_power_consumption.txt"
data <- read.csv(dir, header = TRUE, sep = ";", na.strings = "?")

#select only dates 1-2nd Feb 2007 and overwrite original data.frame
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

#create a variable of POSIXlt class that contains date and time
data$days <- paste(as.character(data$Date), as.character(data$Time))
data$days <- strptime(data$days, "%d/%m/%Y %H:%M:%S")
t
#create a plot of Global Active Power over time and save it to plot2.png wit default 480x480 size
png("plot2.png")
with(data, plot(days, Global_active_power, ylab = "Global active power (kilowatts)", type = "l", xlab= "", xaxt = "l"))

dev.off()

 