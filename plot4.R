## COURSERA DATA SCIENCE ##

## Loading Libraries:
library(readr)
library(lubridate)

# Reading the whole data set
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
# Subsetting data between "2007-02-01" and "2007-02-02"
energy<-subset(data,dmy(Date)==ymd("2007-02-01")|dmy(Date)==ymd("2007-02-02"))
# Opening png graphical device:
png(filename = "plot4.png",width = 480,height = 480)
# Configuring graphic device:
par("mfrow"=c(2,2))
# Plotting to png file:
# Plot 1: Histogram of Global Active Power:
plot(dmy_hms(paste(energy$Date,energy$Time)),energy$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
# Plot 2: Chart of Voltage during time period:
plot(dmy_hms(paste(energy$Date,energy$Time)),energy$Voltage,type = "l",xlab = "datetime",ylab = "Global Active Power (kilowatts)")
# Plot 3: Energy Cub Metering durng time period:
plot(dmy_hms(paste(energy$Date,energy$Time)),sm1,type="l",xlab = "",ylab = "Energy Sub Metering")
lines(dmy_hms(paste(energy$Date,energy$Time)),sm2,type="l",col="red")
lines(dmy_hms(paste(energy$Date,energy$Time)),sm3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd = 1,cex = 0.8)
# Plot 4: Chart of Global Reactive POwer during time period:
plot(dmy_hms(paste(energy$Date,energy$Time)),energy$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global Reactive Power")
# Closing safely png file:
dev.off()