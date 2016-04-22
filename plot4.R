### Read in full file, subset, and remove full file from memory
setwd("c:/users/jeff.JNB/Desktop/R class/EA")
mydata <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?") # Read in data
mydata$Date  <- as.Date(mydata$Date, format = "%d/%m/%Y") #Turns date into date class. Capital Y = 4 digit year.
plotdata <- subset(mydata,mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02")
rm(mydata)
plotdata$dant <- paste(plotdata$Date,plotdata$Time, sep = " ")
plotdata$dant <- strptime(plotdata$dant, format = "%Y-%m-%d %H:%M:%S", tz = "")

### Full Plot 4
par(mfrow=c(2,2))

plot(plotdata$dant, plotdata$Global_active_power ,type = "l", xlab ="", ylab ="Global Active Power")

plot(plotdata$dant,plotdata$Voltage, type = "l", axes = "FALSE", ylab ="Voltage", xlab ="datetime") # remove axis
box() # create the box
axis(2, "Voltage",at = c(234,236,238,240,242,244,246), labels = c(234,"",238,"",242,"",246)) # make labels and hash marks conform to project specs manually
axis(1, labels =c("Thu", "Fri", "Sat"), at = c(1170350000,1170400000,1170450000)) # make labels and hash marks conform to project specs manually

plot(plotdata$dant, plotdata$Sub_metering_1, type = "l", col ="black", ylab = "Energy sub metering", xlab ="")
lines(plotdata$dant,plotdata$Sub_metering_2, type = "l", col ="red")
lines(plotdata$dant,plotdata$Sub_metering_3, type ="l", col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"),bty = "n", cex = 0.5,yjust = 2,xjust=2)

plot(plotdata$dant, plotdata$Global_reactive_power ,type = "l", xlab ="datetime", ylab ="Global_reactive_power")
dev.copy(png,"plot4.png", height = 480, width = 480)
dev.off()