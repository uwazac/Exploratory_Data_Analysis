hpc<-read.table("household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE)
finalHpc1<-filter(hpc2, Date=="2007-02-01")
finalHpc2<-filter(hpc2, Date=="2007-02-02")
finalHpc<-cbind(finalHpc1, finalHpc2)
test<-paste(finalHpc$Date, finalHpc$Time)
test<-mutate(finalHpc, newDate=test)
finalHpc<-test
with(finalHpc, plot(newDate, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
