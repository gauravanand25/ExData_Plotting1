## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds") # emissions data
SCC <- readRDS("Source_Classification_Code.rds")

par(bg="white")
meanYearWise <- lapply( split( NEI$Emissions, NEI$year), sum)
barplot(as.numeric(meanYearWise), names.arg=c(levels(factor(NEI$year))), xlab="Years", ylab="Emissions Levels")
dev.copy(png, file = "plot1.png")
dev.off()
