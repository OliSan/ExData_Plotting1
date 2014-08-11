## Read data in R from 2007-02-01 to 2007-02-02
data<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Change to date and time

x<-strptime(data[,1],format="%d/%m/%Y",tz="")
x<-paste(x,data[,2])
x<-strptime(x,format="%Y-%m-%d %H:%M:%S")

## Time Series Plot of Global active Power 
plot(x,data[,3],type="l",main="",xlab="",ylab="Global Active Power (killowatts)")