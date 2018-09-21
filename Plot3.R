#Set WD
setwd("~/Desktop/coursera/Explanatory-data-analysis-project")

#Load Dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Ploting
baltimoreNEI <- NEI[NEI$fips == "24510",]
yeartype <- aggregate(Emissions ~ year + type, baltimoreNEI, sum)
plot3 <- ggplot(yeartype, aes(year, Emissions, color = type))+ 
         geom_line() +
         ylab(expression('Total PM'[2.5]*" Emissions")) +
         ggtitle('Total Emissions in Baltimore City by type from 1999 to 2008')
dev.copy(png, file = "plot3.png",height=800,width=800)
dev.off()
