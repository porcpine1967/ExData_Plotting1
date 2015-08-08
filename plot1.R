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
png("plot1.png")
hist(chartData$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()