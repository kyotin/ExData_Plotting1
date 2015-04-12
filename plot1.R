myData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
fromDate <- as.Date("2007-02-01","%Y-%m-%d")
endDate <- as.Date("2007-02-02","%Y-%m-%d")
myDataSubset <- myData[which(as.Date(myData$Date,"%d/%m/%Y") >= fromDate & as.Date(myData$Date,"%d/%m/%Y") <= endDate), ]
hist(myDataSubset[,"Global_active_power"],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png",width = 480, height = 480, units = "px")
dev.off()
