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

# plot and save as png file
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
plot(Time1,Data$Sub_metering_1,type="S",
     xlab="",ylab="Energy sub metering ")
lines(Time1,Data$Sub_metering_2,col="red")
lines(Time1,Data$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
dev.off()