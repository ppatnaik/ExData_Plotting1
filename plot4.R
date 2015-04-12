require("sqldf")
require("lubridate")
mydata <- read.csv2.sql(file="household_power_consumption.txt"
                    , sql= "select * from file where date in ('1/2/2007','2/2/2007')"
                    , colClasses=c("character","character", "numeric","numeric","numeric"
                                   ,"numeric","numeric","numeric","numeric"))
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(x = dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Global_active_power
     , type = "l", xlab = "", ylab = "Global Active Power")
plot(x = dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Voltage
     , type = "l", xlab = "datetime", ylab = "Voltage")

plot(x = dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Sub_metering_1
     , type = "l", xlab = "", ylab = "Energy sub metering")
lines(x=dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Sub_metering_2, col="red")
lines(x=dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Sub_metering_3, col="blue")
legend("topright", lwd=2, col=c("black","red","blue"), legend=c("Sub_metering_1"
                                                                ,"Sub_metering_2"
                                                                , "Sub_metering_3")
       , bty="n")

plot(x = dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Global_reactive_power
     , type = "l", xlab = "datetime", ylab = "Global_reactive_power")
#dev.copy(png, file="plot4.png")
dev.off()
