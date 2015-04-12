library(data.table)
setwd("C:\\Users\\rahul\\Documents\\coursera\\exploratory")
f <- file.path(getwd(), "household_power_consumption.txt")
dtPower<-data.table(read.csv(f,sep=";", na.strings="?"))
twoDayPower<-dtPower[(dtPower$Date=="1/2/2007") | (dtPower$Date=="2/2/2007"),]
newTwoDayPower<-data.frame(dt=strptime(paste(twoDayPower$Date, twoDayPower$Time, sep=" "),format="%d/%m/%Y %H:%M:%S"),gap=twoDayPower$Global_active_power)
png("plot2.png",height=480,width=480)
plot(newTwoDayPower$dt,newTwoDayPower$gap,type="l", ylab="Global Active Power(kilowatts)",xlab="")
dev.off()
