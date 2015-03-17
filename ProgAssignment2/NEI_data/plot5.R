NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
vehicle<-grep("Veh", SCC$SCC.Level.Two)
vehicle<-SCC[vehicle,]
merged_veh<-merge(NEI, vehicle, by="SCC")
balt_veh<-filter(merged_veh, fips=="24510")
total_balt_veh<-summarize(group_by(balt_veh, year), sum(Emissions))
plot(total_balt_veh[[1]], total_balt_veh[[2]], xlab="Year", ylab="Emissions", main = " Emissions From Motor Vehicles-Baltimore",type="l", col="red", lwd=2)

