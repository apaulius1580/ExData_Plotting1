
#read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors=FALSE)
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Datetime<-strptime(paste(data$Date,data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

png(file = "plot1.png") 
hist(data$Global_active_power, main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
