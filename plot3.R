myData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
fromDate <- as.Date("2007-02-01","%Y-%m-%d")
endDate <- as.Date("2007-02-02","%Y-%m-%d")
myDataSubset <- myData[which(as.Date(myData$Date,"%d/%m/%Y") >= fromDate & as.Date(myData$Date,"%d/%m/%Y") <= endDate), ]

png(file = "plot3.png",width = 480, height = 480, units = "px")
with(myDataSubset, plot(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),
						Sub_metering_1,type="l", 
						xlab = "", ylab = "Energy sub metering"))
with(myDataSubset, lines(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),
						Sub_metering_2,	xlab = "", ylab = "Energy sub metering",col="red"))
with(myDataSubset, lines(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),
						Sub_metering_3, xlab = "", ylab = "Energy sub metering",col="blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()