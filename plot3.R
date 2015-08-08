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
png("plot3.png")
chartData <- februaryData()
plot(chartData$DateTime, chartData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(chartData$DateTime, chartData$Sub_metering_1, col = "black")
lines(chartData$DateTime, chartData$Sub_metering_2, col = "red")
lines(chartData$DateTime, chartData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty =c(1,1,1), col=c("black", "red", "blue"))
dev.off()