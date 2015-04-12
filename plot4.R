myData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
fromDate <- as.Date("2007-02-01","%Y-%m-%d")
endDate <- as.Date("2007-02-02","%Y-%m-%d")
myDataSubset <- myData[which(as.Date(myData$Date,"%d/%m/%Y") >= fromDate & as.Date(myData$Date,"%d/%m/%Y") <= endDate), ]
par(mfrow = c(2, 2))
with(myDataSubset, {
	#PLOT 1,1
	plot(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),
						Global_active_power,type="l", 
						xlab = "", ylab = "Global Active Power (kilowatts)")
	#PLOT 1,2
	plot(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),Voltage, xlab="datetime", ylab="Voltage", type="l")
	
	#PLOT 2,1
	plot(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),
						Sub_metering_1,type="l", 
						xlab = "", ylab = "Energy sub metering")
	lines(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),
						Sub_metering_2,	xlab = "", ylab = "Energy sub metering",col="red")
	lines(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),
						Sub_metering_3, xlab = "", ylab = "Energy sub metering",col="blue")
	legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, bty="n", xjust=1, yjust=0.5, seg.len=0.5)				
	
	#PLOT 2,2
	plot(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),Global_reactive_power, 
			xlab="datetime", ylab="Global_reactive_power", type="l")
	
})
dev.copy(png, file = "plot4.png",width = 480, height = 480, units = "px")
dev.off()