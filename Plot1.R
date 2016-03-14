setwd("C:/Users/Mike/Dropbox/Coursera Exploratory Data Analysis/")

#Read data from file
powerTemp <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Convert Date and Time colums to R format
powerTemp$Date <- as.Date(powerTemp$Date, "%d/%m/%Y")
str(powerTemp)

#Extract only dates that we are using (Feb 1, 2007 - Feb 2, 2007)
power <- powerTemp[powerTemp$Date >= "2007-02-01" & powerTemp$Date <= "2007-02-02",]
#power$DateTime <- strptime(paste(power$Date,power$Time), "%Y-%m-%d %H:%M:%S") #Doesn't Plot!!
power$DateTime <- as.POSIXct(paste(power$Date,power$Time))
str(power)

#Cleanup unneeded data
rm(powerTemp)

par(mfrow = c(1,1))

#Create Plot1
png("plot1.png",480,480)
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",main = "Global Active Power")
dev.off()
