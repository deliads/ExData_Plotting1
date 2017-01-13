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

## Plot 1
  hist(finalData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)
       ")

