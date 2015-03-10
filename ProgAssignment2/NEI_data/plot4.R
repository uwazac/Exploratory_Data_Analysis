NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
coalRows<-grep("Coal", SCC$Short.Name)
coal<-SCC[coalRows,]
mergedCoal<-merge(NEI, coal, by ="SCC")
totalUScoal<-summarize(group_by(mergedCoal, year), sum(Emissions))
plot(totalUScoal[[1]], totalUScoal[[2]], xlab="Year", ylab="Emissions", main = " Emissions From Coal Combustion Sources",type="l", col="red")

