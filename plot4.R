allDataFile <- "household_power_consumption.txt"
subsetDataFile <- "february_1_2_2007_household_power_consumption.txt"

februaryData <- function(){
    if (file.exists(subsetDataFile)) {
        goodData <- read.csv(subsetDataFile, stringsAsFactors = FALSE)
        goodData$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
        goodData
    } else {
        allData <- read.csv(allDataFile, sep = ";", stringsAsFactors = FALSE)
        goodData <- subset(allData, Date == '1/2/2007' | Date == '2/2/2007')
        write.csv(goodData, file = subsetDataFile, row.names = FALSE)
        goodData$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
        goodData
    }
}
chartData <- februaryData()

png("plot4.png")
par(mfcol = c(2,2))
# plot 2
plot(chartData$DateTime, chartData$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(chartData$DateTime, chartData$Global_active_power)
# plot 3 without box around legend
plot(chartData$DateTime, chartData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(chartData$DateTime, chartData$Sub_metering_1, col = "black")
lines(chartData$DateTime, chartData$Sub_metering_2, col = "red")
lines(chartData$DateTime, chartData$Sub_metering_3, col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty= "n",
       lty =c(1,1,1),
       col=c("black", "red", "blue"))
# New Voltage chart
plot(chartData$DateTime, chartData$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(chartData$DateTime, chartData$Voltage)
# New Global reactive power chart
plot(chartData$DateTime, chartData$Global_reactive_power, type = "n", xlab = "datetime", ylab="Global_reactive_power")
lines(chartData$DateTime, chartData$Global_reactive_power)
dev.off()
