#Set WD
setwd("~/Desktop/coursera/Explanatory-data-analysis-project")

#Load Dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI,SCC,by="SCC")

baltlamotor <- NEI[(NEI$fips=="24510" | NEI$fips == "06037") & NEI$type=="ON-ROAD",  ]
baltlamotoryear <- aggregate(Emissions ~ year + fips, baltlamotor, sum)
baltlamotoryear[baltlamotoryear$fips == "24510",]$fips <- "Baltimore"
baltlamotoryear[baltlamotoryear$fips == "06037",]$fips <- "Los Angeles"
plot6 <- ggplot(baltlamotoryear, aes(factor(year), Emissions)) + 
  facet_grid(. ~ fips) + 
  geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore vs Los Angeles 1999-2008')
dev.copy(png, file = "plot6.png",height=800,width=800)
dev.off()
