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

# plot histogram and save to png file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(Data$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off();