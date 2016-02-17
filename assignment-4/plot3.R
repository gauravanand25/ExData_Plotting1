## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds") # emissions data
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
par(bg="white")
ggplot(NEI) + geom_bar( aes(type, Emissions, fill = as.factor(year)), position= "dodge", stat="summary", fun.y="mean")
dev.copy(png, file = "plot3.png")
dev.off()
