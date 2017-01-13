downloadUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./Data/household_power_consumption.zip"
housePCFile <- "./Data/household_power_consumption.txt"
if (!file.exists(housePCFile)) {
  download.file(downloadUrl, downloadFile, method = "curl")
  unzip(downloadFile, overwrite = T, exdir = "./Data")
}

plotData <- read.table(housePCFile, header = T, sep = ";", na.strings = "?")

Data <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
Time <- strptime(paste(Data$Date, Data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(Time, Data)

## Plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
plot(finalData$Time, finalData$Global_active_power, type = "l", col = "black", xlab = " ", ylab = "Global Active Power (kilowatts)")
plot(finalData$Time, finalData$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")
colorsLines <- c("black", "red", "blue")
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(finalData$Time, finalData$Sub_metering_1, type = "l", col = colorsLines[1], xlab = " ", ylab = "Energy sub metering")
lines(finalData$Time, finalData$Sub_metering_2, type = "l", col = colorsLines[2], xlab = " ", ylab = "Energy sub metering")
lines(finalData$Time, finalData$Sub_metering_3, type = "l", col = colorsLines[3], xlab = " ", ylab = "Energy sub metering")
legend("topright", bty = "n", legend = labels, lty = 1, col = colorsLines, inset = 0.02)
plot(finalData$Time, finalData$Global_reactive_power, type = "l" , col = "black", xlab = "datetime", ylab = "Global_reactive_power")