## plot1.R

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
hist(range$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

##save it as an image
dev.copy(png, "plot1.png")
dev.off()