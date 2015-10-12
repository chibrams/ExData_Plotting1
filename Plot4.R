Plot4 <- function() {
  
  subMetering1 <- as.numeric(subSetData$Sub_metering_1)
  subMetering2 <- as.numeric(subSetData$Sub_metering_2)
  subMetering3 <- as.numeric(subSetData$Sub_metering_3)
  DateTime<- subSetData$DateTime
  Global_reactive_power<- subSetData$Global_reactive_power
  Global_active_power<- subSetData$Global_active_power
  Voltage<- as.numeric(subSetData$Voltage)
  
  par(mfrow=c(2,2))
  
  plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power")

  plot(DateTime,Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(DateTime,subMetering1, type="l", xlab="", ylab="Energy sub metering")
  lines(DateTime,subMetering2,col="red")
  lines(DateTime,subMetering3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  plot(DateTime,Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.copy(png, file="Plot4.png", width=480, height=480)
  dev.off()
}
Plot4()
