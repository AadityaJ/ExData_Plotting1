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
  ##plot 1
hist(data$Global_active_power,main="Global Active Power"
       xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red")
 ## saving in png format
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()