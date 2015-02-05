#Script to create plot1 for Exploratory Data Analysis course, Project 1
#load data into data.frame from the suppored file "household_power_consumption.txt" 
dir <- "household_power_consumption.txt"
data <- read.csv(dir, header = TRUE, sep = ";", na.strings = "?")

#select only dates 1-2nd Feb 2007 and overwrite original data.frame
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

#convert values of Date column into dates
data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))

#create a histogram of Global Active Power and save it to plot1.png wit default 480x480 size
png("plot1.png")
with(data2, hist(Global_active_power, main = "Global Active Power", col = "red" ,xlab = "Global Active Power (kilowatts)"))
dev.off()

