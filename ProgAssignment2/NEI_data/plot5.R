NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
gas<-filter(SCC, SCC.Level.Two=="Highway Vehicles - Gasoline")
mergedGas<-merge(NEI, gas, by="SCC")
balt_gas<-filter(mergedGas, fips=="24510")
total_balt_gas<-summarize(group_by(balt_gas, year), sum(Emissions))
plot(total_balt_gas[[1]], total_balt_gas[[2]], xlab="Year", ylab="Emissions", main = " Emissions From Automobiles-Baltimore",type="l", col="red")

