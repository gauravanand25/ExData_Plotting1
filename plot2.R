# need to read headers separately and set them as colnames
library(data.table)
header <- fread("household_power_consumption.txt", sep = ";",nrows=0, header=TRUE)
householdData <- fread("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", skip=66637,nrows=2880)
setnames(householdData, names(header))

par(bg="white")
householdData[, dateTime:=as.POSIXct(paste(householdData$Date, householdData$Time), format="%d/%m/%Y %H:%M:%S")]
plot(householdData$dateTime, householdData$Global_active_power,  type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()
