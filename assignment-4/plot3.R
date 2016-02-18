## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds") # emissions data
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
par(bg="white")
NEIBaltimore <- NEI[NEI$fips=="24510", ]
g <- ggplot(NEIBaltimore) + geom_bar( aes(type, Emissions, fill = as.factor(year)), position= "dodge", stat="summary", fun.y="sum")
print(g)
dev.copy(png, file = "plot3.png")
dev.off()
