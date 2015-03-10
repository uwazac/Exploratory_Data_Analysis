NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
bal_PM2.5<-filter(NEI, fips == "24510")
bal_sources<-summarize(group_by(bal_PM2.5, type, year), sum(Emissions))
bal_sources$type<-as.factor(bal_sources$type)
qplot(bal_sources$year, bal_sources[[3]], xlab="Year", ylab="Emissions", geom="line", main = "PM2.5 Emissions - Baltimore", color=bal_sources$type)

