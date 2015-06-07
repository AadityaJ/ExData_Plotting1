#Getting The Data 
data_all <- read.csv("F:/Coding stuffs/Coursera/Exp.Dat.An/Project1/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
#Subsetting the data 
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)
## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
##plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="",col='Black')
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,cex = 0.75, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 ## cex is used to determine the size of the legends
## saving in png format
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()