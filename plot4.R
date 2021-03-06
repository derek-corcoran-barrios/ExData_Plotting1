household_power_consumption <- read.csv("~/Rcoursera/household_power_consumption.txt", sep=";", na.strings="?")

HP4 <- within(household_power_consumption, datetime <- strptime(paste(Date, Time),format = "%d/%m/%Y%H:%M:%S"))
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
HP4$Date<-as.Date(HP4$Date, "%d/%m/%Y")

HP5<-HP4[HP4$Date >= DATE1 & HP4$Date <= DATE2,]


png("plot4.png")

par(mfrow=c(2,2))
Sys.setlocale("LC_TIME", "English")
plot(HP5$datetime,HP5$Global_active_power, type="l", ,ylab="Global Active Power (Kilowatts)",xlab="")
plot(HP5$datetime,HP5$Voltage, type="l", ylab="Voltage",xlab="")
plot(HP5$datetime,HP5$Sub_metering_1, type="l",ylab="Energy submetering",xlab="")
lines(HP5$datetime,HP5$Sub_metering_2, col="red")
lines(HP5$datetime,HP5$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty = "n")
plot(HP5$datetime,HP5$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="")

dev.off()


