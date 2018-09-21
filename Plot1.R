#Set WD
setwd("~/Desktop/coursera/Explanatory-data-analysis-project")

#Load Dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Ploting

emissions <- aggregate(Emissions~year,NEI,sum)

plot1 <- barplot(height=emissions$Emissions/1000, names.arg=emissions$year,
            xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,10000),
            main=expression('Total PM'[2.5]*' emissions at various years in kilotons'))
dev.copy(png, file = "plot1.png",height=800,width=800)
dev.off()
