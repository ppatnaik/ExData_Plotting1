require("sqldf")
require("lubridate")

# Read the data
mydata <- read.csv2.sql(file="household_power_consumption.txt"
                    , sql= "select * from file where date in ('1/2/2007','2/2/2007')"
                    , colClasses=c("character","character", "numeric","numeric","numeric"
                                   ,"numeric","numeric","numeric","numeric"))

# Initialize graphics
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Plots
plot(x = dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Sub_metering_1
     , type = "l", xlab = "", ylab = "Energy sub metering")
lines(x=dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Sub_metering_2, col="red")
lines(x=dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Sub_metering_3, col="blue")
legend("topright", lwd=2, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Close graphics
dev.off()
