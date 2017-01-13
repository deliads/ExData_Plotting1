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

## Plot 3
colorsLines <- c("black", "red", "blue")
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(finalData$Time, finalData$Sub_metering_1, type = "l", col = colorsLines[1], xlab = " ", ylab = "Energy sub metering")
lines(finalData$Time, finalData$Sub_metering_2, type = "l", col = colorsLines[2], xlab = " ", ylab = "Energy sub metering")
lines(finalData$Time, finalData$Sub_metering_3, type = "l", col = colorsLines[3], xlab = " ", ylab = "Energy sub metering")
legend("topright", legend = labels, col = colorsLines, lty = "solid", inset = 0.02)

