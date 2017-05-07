powerConsumption <- read.table("household_power_consumption.txt", header= T, sep=";")
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

myData <- powerConsumption[(powerConsumption$Date == "2007-02-01" | powerConsumption$Date == "2007-02-02"),]
myData$Time <- strptime(myData$Time, format= "POSIXlt")
png(file="plot4.png")
par(mfrow= c(2,2))
myData$Global_active_power <- as.numeric(myData$Global_active_power)
#plot1
p1 <- (myData$Global_active_power) * (0.002)
plot(p1, xaxt="n", ylab= "Global Active Power", type="l")
x <- c(1, 1440, 2880)
axis(1, at= x, label= c("Thu", "Fri" , "Sat") )
#plot2
p2 <-  0.1 * (as.numeric(myData$Voltage)) 
plot(p2, xaxt="n", ylab="Voltage", type="l", yaxt="n")
axis(1, at= x, label= c("Thu", "Fri" , "Sat") )
z <- c(80,120,160,200)
axis(2, at=z , labels= c("234","238","242","246"))

#plot3
p3 <- as.numeric(myData$Sub_metering_1)
b <-  as.numeric(myData$Sub_metering_2)
c <-  as.numeric(myData$Sub_metering_3)
plot(p3, col="black", type="l", xaxt="n", ylab="Energy sub metering" )
points(b, col="red", type="l")
points(c, col="blue", type="l")
x <- c(1, 1440, 2880)
axis(1, at= x, label= c("Thu", "Fri" , "Sat") )
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", col=c("black","red","blue"),lty= c(1,1,1) )

#plot4
p4 <- 0.002 * (as.numeric(myData$Global_reactive_power))
plot(p4, xaxt="n", ylab="Global_reactive_power", type="l")
axis(1, at= x, label= c("Thu","Fri","Sat") )

dev.off()

