require("sqldf")

# Read the data
mydata <- read.csv2.sql(file="household_power_consumption.txt"
                    , sql= "select * from file where date in ('1/2/2007','2/2/2007')"
                    , colClasses=c("character","character", "numeric","numeric","numeric"
                                   ,"numeric","numeric","numeric","numeric"))

# Initialize graphics
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Plot histogram
hist(mydata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

# Close graphics
dev.off()
