# read household_power_consumption.txt file
FullData<-read.delim(file="household_power_consumption.txt",
                     sep=";",
                     na.strings=c("?")
)
FullData$Date<-as.Date(FullData$Date,format="%d/%m/%Y")

# Take only relevant data
Data<-FullData[FullData$Date=="2007-02-01"|FullData$Date=="2007-02-02",]

# remove the big data structure
rm(FullData)

# prepare time data
Time<-paste(Data$Date,Data$Time)
Time1<-(strptime (Time,format="%Y-%m-%d %H:%M:%S",tz ="GMT"))

# plot
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(Time1,Data$Global_active_power,type="S",xlab="",ylab="Global Active Power")
plot(Time1,Data$Voltage,type="S",xlab="datetime",ylab="Voltage")
plot(Time1,Data$Sub_metering_1,type="S",
     xlab="",ylab="Energy sub metering ")
lines(Time1,Data$Sub_metering_2,col="red")
lines(Time1,Data$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1, bty="n")
plot(Time1,Data$Global_reactive_power,type="S",xlab="datetime",ylab="Global_reactive_power")
dev.off();