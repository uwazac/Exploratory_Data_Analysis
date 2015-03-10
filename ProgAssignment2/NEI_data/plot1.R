NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
emission_by_year<-summarize(group_by(NEI, year), sum(Emissions))
plot(emission_by_year[[1]], emission_by_year[[2]], xlab="Year", ylab="PM2.5 emissions", main = "Total PM2.5 Emissions",type="l", col="red")

#Total emissions have shown a decreasing trend over the time period evaluated 

