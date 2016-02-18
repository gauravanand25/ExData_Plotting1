## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds") # emissions data
SCC <- readRDS("Source_Classification_Code.rds")

par(bg="white")

categoryOfEISector <- levels(factor(SCC$EI.Sector))
SCC.Coal <- SCC[SCC$EI.Sector %in% c(categoryOfEISector[grep("Coal", levels(factor(SCC$EI.Sector)))]),] # coal data subsetted
mergedData <- merge(NEI, SCC.Coal, by.x="SCC", by.y="SCC") # merged on column SCC
meanYearWise <- lapply( split( mergedData$Emissions, mergedData$year), mean) # mean emissions value for coal category year wise
barplot(as.numeric(meanYearWise), names.arg=c(levels(factor(mergedData$year)))) # bar plot for comparison 

dev.copy(png, file = "plot4.png")
dev.off()
