## plot3.R

##Get correct range of data
x = read.csv2("household_power_consumption.txt", na.strings="?")
x$Date = as.Date(x$Date, "%d/%m/%Y")
begin = as.Date("2007-02-01")
end = as.Date("2007-02-02")
range = x[(x$Date>=begin & x$Date<=end),]

##convert time column to posixlt
fullTimes = paste(range$Date, range$Time)
range$Time = strptime(fullTimes, "%Y-%m-%d %H:%M:%S")

##plot the data
range$Sub_metering_1 = as.numeric(as.character(range$Sub_metering_1))
range$Sub_metering_2 = as.numeric(as.character(range$Sub_metering_2))
range$Sub_metering_3 = as.numeric(as.character(range$Sub_metering_3))
range$Time = as.POSIXct(range$Time, format="%Y-%m-%d %H:%M:%S")
plot(Sub_metering_1 ~ Time, range, type="n", xlab="", ylab="Engery sub metering")
lines(x=range$Time,y=range$Sub_metering_1)
lines(x=range$Time,y=range$Sub_metering_2, col="Red")
lines(x=range$Time,y=range$Sub_metering_3, col="Blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red","blue"), cex=.75)

##save it as an image
dev.copy(png, "plot3.png")
dev.off()