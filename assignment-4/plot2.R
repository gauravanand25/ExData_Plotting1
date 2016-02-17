## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds") # emissions data
SCC <- readRDS("Source_Classification_Code.rds")

par(bg="white")
NEIBaltimore <- NEI[NEI$fips=="24510", ]
meanYearWise <- lapply( split( NEIBaltimore$Emissions, NEIBaltimore$year), mean)
barplot(as.numeric(meanYearWise), names.arg=c(levels(factor(NEIBaltimore$year))), xlab="Years", ylab="Emissions Levels")
dev.copy(png, file = "plot2.png")
dev.off()
