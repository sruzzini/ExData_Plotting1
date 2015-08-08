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

##setup for 4 plots
par(mfcol = c(2,2))

##plot the first plot
range$Global_active_power = as.numeric(as.character(range$Global_active_power))
range$Time = as.POSIXct(range$Time, format="%Y-%m-%d %H:%M:%S")
plot(Global_active_power ~ Time, range, "l", xlab="", ylab="Global Active Power")

##plot the second plot
range$Sub_metering_1 = as.numeric(as.character(range$Sub_metering_1))
range$Sub_metering_2 = as.numeric(as.character(range$Sub_metering_2))
range$Sub_metering_3 = as.numeric(as.character(range$Sub_metering_3))
plot(Sub_metering_1 ~ Time, range, type="n", xlab="", ylab="Engery sub metering")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=.35, bty="n", lty=1, col=c("black","red","blue"))
lines(x=range$Time,y=range$Sub_metering_1)
lines(x=range$Time,y=range$Sub_metering_2, col="Red")
lines(x=range$Time,y=range$Sub_metering_3, col="Blue")

##plot the third plot
range$Voltage = as.numeric(as.character(range$Voltage))
plot(Voltage ~ Time, range, "l", xlab="datetime", ylab="Voltage")

##plot the fourth plot
range$Global_reactive_power = as.numeric(as.character(range$Global_reactive_power))
plot(Global_reactive_power ~ Time, range, "l", xlab="datetime", ylab="Global_reactive_power")

##save it as an image
dev.copy(png, "plot4.png")
dev.off()