files <- file('./household_power_consumption.txt')  
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')  

# convert data and time to specific format  
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')  
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))  

## plot globalactivepower vs date&time
png("plot2.png", width=480, height=480)
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power(kiliwatts)"))
dev.off()  

