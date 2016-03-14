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
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()

#Create Plot2
plot(power$Global_active_power~power$DateTime, ylab = "Global Active Power (kilowatts)", xlab = "", type="l")
dev.copy(png, "plot2.png")
dev.off()

#Create Plot3
plot(power$Sub_metering_1~power$DateTime, ylab = "Global Active Power (kilowatts)", xlab = "", type="n")
legend("topright", lty = c(1,1,1), col = (c("black","blue","red")), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
points(power$Sub_metering_1~power$DateTime, type="l")
points(power$Sub_metering_2~power$DateTime, type="l", col="red")
points(power$Sub_metering_3~power$DateTime, type="l", col="blue")
dev.copy(png, "plot3.png")
dev.off()

#Create Plot4
par(mar = c(4,4,3,3))
par(mfrow = c(2,2))
  #plot1
  plot(power$Global_active_power~power$DateTime, ylab = "Global Active Power (kilowatts)", xlab = "", type="l")

  #plot2
  plot(power$Voltage~power$DateTime, ylab = "Voltage", xlab = "datetime", type="l")

  #plot3
  plot(power$Sub_metering_1~power$DateTime, ylab = "Global Active Power (kilowatts)", xlab = "", type="n")
  # legend("topright", cex = 1, bty = "n",y.intersp = .4, lty = c(1,1,1), col = (c("black","blue","red")), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  legend("topright", bty = "n", lty = c(1,1,1), col = (c("black","blue","red")), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  points(power$Sub_metering_1~power$DateTime, type="l")
  points(power$Sub_metering_2~power$DateTime, type="l", col="red")
  points(power$Sub_metering_3~power$DateTime, type="l", col="blue")

  #plot4
  plot(power$Global_reactive_power~power$DateTime, ylab = "Global_reactive_power", xlab = "datetime", type="l")
  
  #save plot
  dev.copy(png, "plot4.png")
  dev.off()
  