require("sqldf")
require("lubridate")

# Read the data
mydata <- read.csv2.sql(file="household_power_consumption.txt"
                    , sql= "select * from file where date in ('1/2/2007','2/2/2007')"
                    , colClasses=c("character","character", "numeric","numeric","numeric"
                                   ,"numeric","numeric","numeric","numeric"))

# Initialize graphics
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Plot
plot(x = dmy_hms(paste(mydata$Date, mydata$Time)), y=mydata$Global_active_power
     , type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close graphics
dev.off()
