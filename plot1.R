require("sqldf")
mydata <- read.csv2.sql(file="household_power_consumption.txt"
                    , sql= "select * from file where date in ('1/2/2007','2/2/2007')"
                    , colClasses=c("character","character", "numeric","numeric","numeric"
                                   ,"numeric","numeric","numeric","numeric"))
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(mydata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
