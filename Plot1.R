## Read data in R from 2007-02-01 to 2007-02-02
data<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

##Plot 1: Histogram of Global Active Power
hist(data[,3],main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")