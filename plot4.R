# need to read headers separately and set them as colnames
library(data.table)
header <- fread("household_power_consumption.txt", sep = ";",nrows=0, header=TRUE)
householdData <- fread("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", skip=66637,nrows=2880)
setnames(householdData, names(header))

householdData[, dateTime:=as.POSIXct(paste(householdData$Date, householdData$Time), format="%d/%m/%Y %H:%M:%S")]

par(bg="white")
par(mfrow=c(2,2))

# plot 1
householdData[, dateTime:=as.POSIXct(paste(householdData$Date, householdData$Time), format="%d/%m/%Y %H:%M:%S")]
plot(householdData$dateTime, householdData$Global_active_power,  type="l", ylab="Global Active Power (kilowatts)", xlab="")

# plot 2
plot(householdData$dateTime, householdData$Voltage,  type="l", ylab="Voltage", xlab="datetime")

# plot 3
plot(householdData$dateTime, householdData$Sub_metering_1,  type="l", xlab="", ylab="Energy sub metering")
lines(householdData$dateTime, householdData$Sub_metering_2, col="red")
lines(householdData$dateTime, householdData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black", "red", "blue"))

# plot 4
plot(householdData$dateTime, householdData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()
