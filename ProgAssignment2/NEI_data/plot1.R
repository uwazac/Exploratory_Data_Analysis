# Read in the data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load the 'dplyr' functions
library(dplyr)

# Use the summarize function from dplyr to find the total emmisions in different years
emission_by_year<-summarize(group_by(NEI, year), sum(Emissions))

# Use the plot function to display the data
plot(emission_by_year[[1]], emission_by_year[[2]], xlab="Year", ylab="PM2.5 emissions", main = "US Total PM2.5 Emissions",type="l", col="red", lwd=2, xaxt="n")

# Change the x-axis labels to align with the data time points
axis(1,at=c(1999, 2002, 2005, 2008))
# Total emissions have shown a decreasing trend over the time period evaluated 

