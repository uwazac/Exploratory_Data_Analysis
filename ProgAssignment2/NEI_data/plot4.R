# Read the data into memory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load the 'dplyr' and 'ggplot2' libraries
library(dplyr)
library(ggplot2)

# Find a rows on the basis of the term "Coal"
coalRows<-grep("Coal", SCC$Short.Name)

# Generate the 'coal' data.frame from the rows stored in the 'coalRows' object
coal<-SCC[coalRows,]

# Use the merge function to merge the 'NEI' and 'coal'data.frames by the 'SCC' variable
mergedCoal<-merge(NEI, coal, by ="SCC")

# Use the dplyr functions 'summarize' to stratify the merged data on the bais of year and Emissions
totalUScoal<-summarize(group_by(mergedCoal, year), sum(Emissions))

# Change column names to more 'R' friendly versions
colnames(totalUScoal)[[2]]<-"Emissions"
colnames(totalUScoal)[[1]]<-"Year"

# Create a base ploe using the ggplot function 
g<-ggplot(totalUScoal, aes(Year, Emissions))

# Add layers to the plot for display
g+geom_point(aes(color=Year), size=4,alpha=1/2)+ labs(title="Total US Emissions From Coal Combustion Sources") + theme_bw(base_family="Arial", base_size=14)+geom_smooth(size=2, linetype=1, method="lm")

