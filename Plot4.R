#Set WD
setwd("~/Desktop/coursera/Explanatory-data-analysis-project")

#Load Dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI,SCC,by="SCC")
matchindex  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
coaldata <- NEISCC[matchindex,]
#Ploting

coalyear <- aggregate(Emissions~year,coaldata,sum)
plot4 <- barplot(height=coalyear$Emissions/1000, names.arg=coalyear$year,
                 xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,1000),
                 main=expression('Total PM'[2.5]*' emissions from coal combustion-related sources at various years in kilotons'))
text(x = plot4, y = round(coalyear$Emissions/1000,2),
     label = round(coalyear$Emissions/1000,2), pos = 3, cex = 1.2, col = "black")
dev.copy(png, file = "plot4.png",height=800,width=800)
dev.off()
