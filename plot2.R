powerConsumption <- read.table("household_power_consumption.txt", header= T, sep=";")
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

myData <- powerConsumption[(powerConsumption$Date == "2007-02-01" | powerConsumption$Date == "2007-02-02"),]
myData$Time <- strptime(myData$Time, format= "POSIXlt")
myData$Global_active_power <- as.numeric(myData$Global_active_power)
png(file="plot2.png")
d <- (myData$Global_active_power) * (0.002)
plot(d, xaxt="n", ylab= "Global Active Power", type="l")
x <- c(1, 1440, 2880)
axis(1, at= x, label= c("Thursday", "Friday" , "Saturday") )
dev.off()
