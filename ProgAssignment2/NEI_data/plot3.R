# Read the data into memory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load the 'dplyr' and 'ggplot2' libraries
library(dplyr)
library(ggplot2)

# Use the filter function from dplyr to extract Baltimore data based on the 'fips' variable
bal_PM2.5<-filter(NEI, fips == "24510")

# Use the summarize function from 'dplyr' to neatly summarize the data
bal_sources<-summarize(group_by(bal_PM2.5, type, year), sum(Emissions))

# Convert the 'type' variable to a factor to facilitate presenting the data as categories
bal_sources$type<-as.factor(bal_sources$type)

# Generate the plot using the 'qplot' function from ggplot2
# Plot the log value of 'Emissions' to allow more readable display of the data
qplot(bal_sources$year, log(bal_sources[[3]]), xlab="Year", ylab="log(Emissions)", geom="line", main = "PM2.5 Emissions - Baltimore", color=bal_sources$type)
