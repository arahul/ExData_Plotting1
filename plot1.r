library(data.table)
setwd("C:\\Users\\rahul\\Documents\\coursera\\exploratory")
f <- file.path(getwd(), "household_power_consumption.txt")
dtPower<-data.table(read.csv(f,sep=";", na.strings="?"))
twoDayPower<-dtPower[(dtPower$Date=="1/2/2007") | (dtPower$Date=="2/2/2007"),]
png("plot1.png",height=480,width=480)
hist(twoDayPower$Global_active_power,freq=TRUE, main="Global Active Power",xlab="Global Active Power(kilowatts)", col="red",ylab="Frequency")
dev.off()

