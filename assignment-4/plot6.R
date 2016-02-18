## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds") # emissions data
SCC <- readRDS("Source_Classification_Code.rds")

par(bg="white")

library(ggplot2)
categoryOfEISector <- levels(factor(SCC$EI.Sector))
SCC.Vehicle <- SCC[SCC$EI.Sector %in% c(categoryOfEISector[grep("Mobile", levels(factor(SCC$EI.Sector)))]),] # motor vehicles
NEI.BaltimoreLCA <- subset( NEI, (fips=="24510")|(fips=="06037") ) # subsetting for baltimore and Los Angeles County
mergedData <- merge(NEI.BaltimoreLCA, SCC.Vehicle, by.x="SCC", by.y="SCC") # merged on column SCC
ggplot(NEI.BaltimoreLCA) + geom_bar( aes(fips, Emissions, fill = as.factor(year)), position= "dodge", stat="summary", fun.y="mean")

dev.copy(png, file = "plot6.png")
dev.off()
