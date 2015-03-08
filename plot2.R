test<-paste(finalHpc$Date, finalHpc$Time)
test<-mutate(finalHpc, newDate=test)
finalHpc<-test
finalHpc$newDate<-strptime(finalHpc$newDate, format="%F %H:%M:%S")
with(finalHpc, plot(newDate, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
