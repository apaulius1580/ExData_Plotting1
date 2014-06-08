
#read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors=FALSE)
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Datetime<-strptime(paste(data$Date,data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")
par(mfrow = c(2, 2))
hist(data$Global_active_power, main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency")
with(data, plot(Datetime,Global_active_power, type="l", xlab="datetime"))
with(data, plot(Datetime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data,lines(Datetime,Sub_metering_2, col="red"))
with(data,lines(Datetime,Sub_metering_3, col="blue"))
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty=c(1,1),text.col=c("black"),bty = "n")
with(data, plot(Datetime,Global_reactive_power, type="l", xlab="datetime"))

dev.off()
