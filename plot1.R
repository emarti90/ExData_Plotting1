## COURSERA DATA SCIENCE ##

## Loading Libraries:
library(readr)
library(lubridate)

# Reading the whole data set
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
# Subsetting data between "2007-02-01" and "2007-02-02"
energy<-subset(data,dmy(Date)==ymd("2007-02-01")|dmy(Date)==ymd("2007-02-02"))
# Opening png graphical device:
png(filename = "plot1.png",width = 480,height = 480)
# Plotting Histogram to PNG file:
hist(energy$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
# Closing safely png file:
dev.off()




