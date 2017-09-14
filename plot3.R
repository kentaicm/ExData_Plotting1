setwd("D:/Documents/R/Exploratory Data/")

downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "D:/Documents/R/Exploratory Data/household_power_consumption.zip"
householdFile <- "D:/Documents/R/Exploratory Data/household_power_consumption.txt"

if (!file.exists(householdFile)) {
        download.file(downloadURL, downloadFile)
        unzip(downloadFile, overwrite = T)
}
## Read the table
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")

## Cut data of 1/2/2007 - 2/2/2007 out from the plotData
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

## Generate Plot 3
par(mfrow=c(1,1))
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
png(filename="plot3.png")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()



