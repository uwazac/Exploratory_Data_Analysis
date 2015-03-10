NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
gas<-filter(SCC, SCC.Level.Two=="Highway Vehicles - Gasoline")
mergedGas<-merge(NEI, gas, by="SCC")
balt_gas<-filter(mergedGas, fips=="24510")
los_gas<-filter(mergedGas, fips=="06037")

balt_gas$fips<-"Balt"
los_gas$fips<-"LA"

bals_VS_LA_Emissions<-summarize(group_by(balt_VS_LA, fips, year), sum(Emissions))

bals_VS_LA_Emissions$fips<-as.factor(bals_VS_LA_Emissions$fips)

colnames(bals_VS_LA_Emissions)[[1]]<-"City"

bals_VS_LA_Emissions<-as.data.frame(bals_VS_LA_Emissions)

g<-ggplot(bals_VS_LA_Emissions, aes(year, log(Emissions)))

g + geom_point(aes(color=City), size=4,alpha=1/2) +facet_grid(.~City) + labs(title="Auto Emissions - Balt vs LA") + theme_bw(base_family="Avenir", base_size=12)+geom_smooth(size=4, linetype=3,method="lm", se=FALSE)

#Alternative using base plotting system
#qplot(bals_VS_LA_Emissions$year, log(bals_VS_LA_Emissions[[3]]), xlab="Year", ylab="Emissions", geom=c("point","smooth"),method="lm", main = "Auto Emissions - Baltimore vs LA", color=bals_VS_LA_Emissions$City)

