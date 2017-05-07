powerConsumption <- read.table("household_power_consumption.txt", header= T, sep=";")
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

myData <- powerConsumption[(powerConsumption$Date == "2007-02-01" | powerConsumption$Date == "2007-02-02"),]
myData$Time <- strptime(myData$Time, format= "POSIXlt")
myData$Global_active_power <- as.numeric(myData$Global_active_power)
png(file="plot1.png")
d <- (myData$Global_active_power) * (0.002)
hist(d, col="red", xlab= "Global Active Power", main= "Global Active Power (kilowatts)")
dev.off()
