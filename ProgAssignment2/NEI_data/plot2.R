# Read the data into memory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load the 'dplyr' library
library(dplyr)

# Filter the data on "fips" using the 'dplry' filter function 
bal_PM2.5<-filter(NEI, fips == "24510")

# Use the summarize function from dplyr to find the total emmisions in different years
bal_emsP2.5<-summarize(group_by(bal_PM2.5,year), sum(Emissions))

# Use the plot function to display the data
plot(bal_emsP2.5[[1]], bal_emsP2.5[[2]], xlab="Year", ylab="PM2.5 emissions", main = "Total PM2.5 Emissions - Baltimore",type="l", col="red", lwd=2, xaxt="n")

# Change the x-axis labels to align with the data time points
axis(1,at=c(1999, 2002, 2005, 2008))