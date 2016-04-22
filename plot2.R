### Read in full file, subset, and remove full file from memory
setwd("c:/users/jeff.JNB/Desktop/R class/EA")
mydata <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?") # Read in data
mydata$Date  <- as.Date(mydata$Date, format = "%d/%m/%Y") #Turns date into date class. Capital Y = 4 digit year.
plotdata <- subset(mydata,mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02")
rm(mydata)
plotdata$dant <- paste(plotdata$Date,plotdata$Time, sep = " ")
plotdata$dant <- strptime(plotdata$dant, format = "%Y-%m-%d %H:%M:%S", tz = "")

### Plot 2
plot(plotdata$dant, plotdata$Global_active_power ,type = "l", xlab ="", ylab ="Global Active Power (kilowats)")
dev.copy(png,"plot2.png", height = 480, width = 480)
dev.off()