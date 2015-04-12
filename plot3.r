library(data.table)
setwd("C:\\Users\\rahul\\Documents\\coursera\\exploratory")
f <- file.path(getwd(), "household_power_consumption.txt")
dtPower<-data.table(read.csv(f,sep=";", na.strings="?"))
twoDayPower<-dtPower[(dtPower$Date=="1/2/2007") | (dtPower$Date=="2/2/2007"),]
newTwoDayPower<-data.frame(dt=strptime(paste(twoDayPower$Date, twoDayPower$Time, sep=" "),format="%d/%m/%Y %H:%M:%S"),gap=twoDayPower$Global_active_power,sm1=twoDayPower$Sub_metering_1,sm2=twoDayPower$Sub_metering_2,sm3=twoDayPower$Sub_metering_3)
png("plot3.png",height=480,width=480)
with(newTwoDayPower,plot(dt,sm1,xlab="",ylab="Energy sub metering",type="l"))
with(newTwoDayPower,lines(dt,sm2,col="red",type="l"))
with(newTwoDayPower,lines(dt,sm3,col="blue",type="l"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=, lwd=2.5,bty="o")
dev.off()

