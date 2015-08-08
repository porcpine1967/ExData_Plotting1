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
png("plot2.png")
plot(chartData$DateTime, chartData$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(chartData$DateTime, chartData$Global_active_power)
dev.off()