### Read in full file, subset, and remove full file from memory
setwd("c:/users/jeff.JNB/Desktop/R class/EA")
mydata <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?") # Read in data
mydata$Date  <- as.Date(mydata$Date, format = "%d/%m/%Y") #Turns date into date class. Capital Y = 4 digit year.
plotdata <- subset(mydata,mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02")
rm(mydata)
plotdata$dant <- paste(plotdata$Date,plotdata$Time, sep = " ")
plotdata$dant <- strptime(plotdata$dant, format = "%Y-%m-%d %H:%M:%S", tz = "")

### Plot 3
plot(plotdata$dant, plotdata$Sub_metering_1, type = "l", col ="black", ylab = "Energy sub metering", xlab ="")
lines(plotdata$dant,plotdata$Sub_metering_2, type = "l", col ="red")
lines(plotdata$dant,plotdata$Sub_metering_3, type ="l", col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
dev.copy(png,"plot3.png", height = 480, width = 480)
dev.off()