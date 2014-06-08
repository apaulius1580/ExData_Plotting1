
#read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors=FALSE)
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Datetime<-strptime(paste(data$Date,data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

png(file = "plot3.png") 
with(data, plot(Datetime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data,lines(Datetime,Sub_metering_2, col="red"))
with(data,lines(Datetime,Sub_metering_3, col="blue"))
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty=c(1,1),
       ncol=1,cex=0.8,bty="1", inset =c(0,0),text.col=c("black"))
dev.off()