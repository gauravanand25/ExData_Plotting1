# need to read headers separately and set them as colnames
library(data.table)
header <- fread("household_power_consumption.txt", sep = ";",nrows=0, header=TRUE)
householdData <- fread("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", skip=66637,nrows=2880)
setnames(householdData, names(header))

# par bg white sets the background white if you save in png then it is necessary
par(bg="white")
hist(householdData$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
