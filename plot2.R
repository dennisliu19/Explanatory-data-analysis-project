#Set WD
setwd("~/Desktop/coursera/Explanatory-data-analysis-project")

#Load Dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Ploting

baltimoreNEI <- NEI[NEI$fips == "24510",]
baltimoreemm <- aggregate(Emissions~year,baltimoreNEI,sum)
plot2 <- barplot(height=baltimoreemm$Emissions/1000, names.arg=baltimoreemm$year,
                 xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,4),
                 main=expression('Total PM'[2.5]*' emissions at various years in kilotons for Baltimore'))
dev.copy(png, file = "plot2.png",height=800,width=800)
dev.off()
