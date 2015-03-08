household_power_consumption <- read.csv("~/Rcoursera/household_power_consumption.txt", sep=";", na.strings="?")

HP2 <- within(household_power_consumption, datetime <- strptime(paste(Date, Time),format = "%d/%m/%Y%H:%M:%S"))
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
HP2$Date<-as.Date(HP2$Date, "%d/%m/%Y")

HP3<-HP2[HP2$Date >= DATE1 & HP2$Date <= DATE2,]


png("plot2.png")
Sys.setlocale("LC_TIME", "English")

plot(HP3$datetime,HP3$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)",xlab="")

dev.off()
