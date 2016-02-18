## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds") # emissions data
SCC <- readRDS("Source_Classification_Code.rds")

par(bg="white")

categoryOfEISector <- levels(factor(SCC$EI.Sector))
SCC.Vehicle <- SCC[SCC$EI.Sector %in% c(categoryOfEISector[grep("Mobile", levels(factor(SCC$EI.Sector)))]),] # motor vehicles
NEI.Baltimore <- subset( NEI, fips=="24510") # subsetting for baltimore
mergedData <- merge(NEI.Baltimore, SCC.Vehicle, by.x="SCC", by.y="SCC") # merged on column SCC
meanYearWise <- lapply( split( mergedData$Emissions, mergedData$year), mean) # mean emissions value for vehicles year wise
barplot(as.numeric(meanYearWise), names.arg=c(levels(factor(mergedData$year)))) # bar plot for comparison 

dev.copy(png, file = "plot5.png")
dev.off()
