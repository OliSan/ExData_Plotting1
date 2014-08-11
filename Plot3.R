## Read data in R from 2007-02-01 to 2007-02-02
data<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)

## Change to date and time

x<-strptime(data[,1],format="%d/%m/%Y",tz="")
x<-paste(x,data[,2])
x<-strptime(x,format="%Y-%m-%d %H:%M:%S")

##Plot

with(data,plot(x,data[,7],type="n",xlab="",ylab="Energy sub metering"))
with(subset(new_data, factor=="Sub metering 1"),lines(x,data[,7],col="black"))
with(subset(new_data, factor=="Sub metering 2"),lines(x,data[,8],col="red"))
with(subset(new_data, factor=="Sub metering 2"),lines(x,data[,9],col="blue"))
legend("topright", pch = 1, col = c("black","red", "blue"), legend = c("Sub metering 1", "Sub metering 2","Sub metering 3"))

