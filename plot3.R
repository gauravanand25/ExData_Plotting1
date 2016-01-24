# need to read headers separately and set them as colnames
library(data.table)
header <- fread("household_power_consumption.txt", sep = ";",nrows=0, header=TRUE)
householdData <- fread("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", skip=66637,nrows=2880)
setnames(householdData, names(header))

par(bg="white")
householdData[, dateTime:=as.POSIXct(paste(householdData$Date, householdData$Time), format="%d/%m/%Y %H:%M:%S")]
plot(householdData$dateTime, householdData$Sub_metering_1,  type="l", xlab="", ylab="Energy sub metering")
lines(householdData$dateTime, householdData$Sub_metering_2, col="red")
lines(householdData$dateTime, householdData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png")
dev.off()
