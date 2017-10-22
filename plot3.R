## COURSERA DATA SCIENCE ##

## Loading Libraries:
library(readr)
library(lubridate)

# Reading the whole data set
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
# Subsetting data between "2007-02-01" and "2007-02-02"
energy<-subset(data,dmy(Date)==ymd("2007-02-01")|dmy(Date)==ymd("2007-02-02"))
# Opening png graphical device:
png(filename = "plot3.png",width = 480,height = 480)
# Plotting Chart to a png file:
plot(dmy_hms(paste(energy$Date,energy$Time)),sm1,type="l",xlab = "",ylab = "Energy Sub Metering")
lines(dmy_hms(paste(energy$Date,energy$Time)),sm2,type="l",col="red")
lines(dmy_hms(paste(energy$Date,energy$Time)),sm3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1:2,cex = 0.6)
# Closing safely png file:
dev.off()