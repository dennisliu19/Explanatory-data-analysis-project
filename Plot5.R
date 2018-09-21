#Set WD
setwd("~/Desktop/coursera/Explanatory-data-analysis-project")

#Load Dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI,SCC,by="SCC")

baltimoremotor <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
baltimoremotoryear <- aggregate(Emissions~year,baltimoremotor,sum)
plot5 <- barplot(height=baltimoremotoryear$Emissions, names.arg=baltimoremotoryear$year,
                 xlab="years", ylab=expression('total PM'[2.5]*' emission in tons'),ylim=c(0,400),
                 main=expression('Total PM'[2.5]*' emissions at various years in tons by motor vehicle for Baltimore'))
text(x = plot5, y = round(baltimoremotoryear$Emissions,2),
     label = round(baltimoremotoryear$Emissions,2), pos = 3, cex = 1.2, col = "black")
dev.copy(png, file = "plot5.png",height=800,width=800)
dev.off()
