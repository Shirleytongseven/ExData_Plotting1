files <- file('./household_power_consumption.txt')  
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')  

# convert data and time to specific format  
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')  
data$DateTime <- as.POSIXct(paste(data$Date, data$Time)) 

## plot the 4 graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(data, plot(DateTime, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(data$DateTime, data$Sub_metering_2,type="l", col= "red")
lines(data$DateTime, data$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
