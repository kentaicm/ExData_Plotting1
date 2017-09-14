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

## Generate Plot 1
par(mfrow=c(1,1))
png(filename="plot1.png")
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()