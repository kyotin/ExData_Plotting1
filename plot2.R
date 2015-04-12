myData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
fromDate <- as.Date("2007-02-01","%Y-%m-%d")
endDate <- as.Date("2007-02-02","%Y-%m-%d")
myDataSubset <- myData[which(as.Date(myData$Date,"%d/%m/%Y") >= fromDate & as.Date(myData$Date,"%d/%m/%Y") <= endDate), ]
with(myDataSubset,plot(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"),
						Global_active_power,type="l", 
						xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png",width = 480, height = 480, units = "px")
dev.off()