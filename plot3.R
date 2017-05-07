powerConsumption <- read.table("household_power_consumption.txt", header= T, sep=";")
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

myData <- powerConsumption[(powerConsumption$Date == "2007-02-01" | powerConsumption$Date == "2007-02-02"),]
myData$Time <- strptime(myData$Time, format= "POSIXlt")

png(file="plot3.png")
a <- as.numeric(myData$Sub_metering_1)
b <-  as.numeric(myData$Sub_metering_2)
c <-  as.numeric(myData$Sub_metering_3)
plot(a, col="black", type="l", xaxt="n", ylab="Energy sub metering")
points(b, col="red", type="l")
points(c, col="blue", type="l")
x <- c(1, 1440, 2880)
axis(1, at= x, label= c("Thu", "Fri" , "Sat") )
dev.off()
