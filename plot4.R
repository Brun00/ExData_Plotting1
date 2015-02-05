#Script to create plot4 for Exploratory Data Analysis course, Project 1
#load data into data.frame from the suppored file "household_power_consumption.txt" 
dir <- "household_power_consumption.txt"
data <- read.csv(dir, header = TRUE, sep = ";", na.strings = "?")

#select only dates 1-2nd Feb 2007 and overwrite original data.frame
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

#create a variable of POSIXlt class that contains date and time
data$days <- paste(as.character(data$Date), as.character(data$Time))
data$days <- strptime(data$days, "%d/%m/%Y %H:%M:%S")

#create a plot of Energy sub metering over time and save it to plot3.png wit default 480x480 size
png("plot4.png")

#create matrix of 4 plots 2by2
par(mfrow = c(2,2))

# Create 1st plot: Global Active Pover vs Time with no x label
with(data, plot(days, Global_active_power, ylab = "Global Active Power", type = "l", xlab= "", xaxt = "l"))

# Create 2nd plot: Voltage vs Time with x label "datetime"
with(data, plot(days, Voltage, ylab = "Voltage", type = "l", xlab= "datetime", xaxt = "l"))


# Create 3rd plot: Sub metering vs Time
with(data, plot(days, Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab= "", xaxt = "l"))
with(data, lines(days, Sub_metering_2, col = 2))
with(data, lines(days, Sub_metering_3, col = 4))
legend("topright", lty = 1, col = c(1,2,4), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#Create 4th plot: Global reactive power vs Time
with(data, plot(days, Global_reactive_power, type = "l", xlab= "datetime", xaxt = "l"))

dev.off()

 