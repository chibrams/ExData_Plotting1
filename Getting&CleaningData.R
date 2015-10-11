library(data.table)
# Loading and unzipping HouseHoldData.
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/HPCDataset.zip",method="auto")
dataFile<-unzip(zipfile="./data/HPCDataset.zip",exdir="./data")
# Subsetting data to the 1st two days of february (to speed up the processing).
HouseHoldData<- read.table(dataFile, header=T, sep=";")
HouseHoldData$Date <- as.Date(HouseHoldData$Date, format="%d/%m/%Y")
subSetData <- HouseHoldData[(HouseHoldData$Date=="2007-02-01") | (HouseHoldData$Date=="2007-02-02"),]
# Convert the Date and Time variables to Date/Time classes.
subSetData <- transform(subSetData , DateTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
# Convert other columns to the correct types
subSetData $Global_active_power <- as.numeric(as.character(subSetData $Global_active_power))
subSetData $Global_reactive_power <- as.numeric(as.character(subSetData $Global_reactive_power))
subSetData $Voltage <- as.numeric(as.character(subSetData $Voltage))
subSetData $Global_intensity <- as.numeric(subSetData $Global_intensity)
subSetData $Sub_metering_1 <- as.numeric(as.character(subSetData $Sub_metering_1))
subSetData $Sub_metering_2 <- as.numeric(as.character(subSetData $Sub_metering_2))
subSetData $Sub_metering_3 <- as.numeric(as.character(subSetData $Sub_metering_3))
# Cleaning workspace from data source files.
unlink("data", recursive=TRUE)