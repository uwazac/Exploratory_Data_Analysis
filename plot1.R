hpc<-read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE)
newDates<-as.Date(hpc$Date, format  = "%d/%m/%Y")
newHpc<-lapply(hpc[,3:9], function(x) as.numeric(x))
newHpc<-as.data.frame(newHpc)
hpc2<-cbind(hpc[,1:2], newHpc)
hpc2$Date<-newDates
finalHpc1<-filter(hpc2, Date=="2007-02-01")
finalHpc2<-filter(hpc2, Date=="2007-02-02")
finalHpc<-rbind(finalHpc1, finalHpc2)
newDate<-as.Date(finalHpc$Date, format  = "%d/%m/%y")
finalHpc$Date<-newDate
test<-paste(as.character(finalHpc$Date), finalHpc$Time)
test<-mutate(finalHpc, newDate=test)
finalHpc<-test
finalHpc$newDate<-strptime(finalHpc$newDate, format="%F %H:%M:%S")
hist(finalHpc$Global_active_power, freq = TRUE, breaks = 11, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red", bg = "transparent", main = "Global Active Power")
