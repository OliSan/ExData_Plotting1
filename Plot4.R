## Read data in R from 2007-02-01 to 2007-02-02
data<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Change to date and time

x<-strptime(data[,1],format="%d/%m/%Y",tz="")
x<-paste(x,data[,2])
x<-strptime(x,format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
## Plot 1
hist(data[,3],main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
x<-strptime(data[,1],format="%d/%m/%Y",tz="")
x<-paste(x,data[,2])
x<-strptime(x,format="%Y-%m-%d %H:%M:%S")

## Plot 2
plot(x,data[,3],type="l",main="",xlab="",ylab="Global Active Power (killowatts)")

##Plot 3
with(data,plot(x,data[,7],type="n",xlab="",ylab="Energy sub metering"))
with(subset(new_data, factor=="Sub metering 1"),lines(x,data[,7],col="black"))
with(subset(new_data, factor=="Sub metering 2"),lines(x,data[,8],col="red"))
with(subset(new_data, factor=="Sub metering 2"),lines(x,data[,9],col="blue"))
legend("topright", pch = 1, col = c("black","red", "blue"), legend = c("Sub metering 1", "Sub metering 2","Sub metering 3"))

##Plot 4
plot(x,data[,4],type="l",main="",xlab="datetime",ylab="Global Reactive Power")