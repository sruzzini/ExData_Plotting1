## plot2.R

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
range$Global_active_power = as.numeric(as.character(range$Global_active_power))
range$Time = as.POSIXct(range$Time, format="%Y-%m-%d %H:%M:%S")
plot(Global_active_power ~ Time, range, "l", xlab="", ylab="Global Active Power (kilowatts)")

##save it as an image
dev.copy(png, "plot2.png")
dev.off()