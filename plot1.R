household_power_consumption <- read.csv("~/Rcoursera/household_power_consumption.txt", sep=";", na.strings="?")

household_power_consumption$Date<-as.Date(household_power_consumption$Date, "%d/%m/%Y")
household_power_consumption$Time<-strptime(household_power_consumption$Time, "%H:%M:%S")
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
HP<-household_power_consumption[household_power_consumption$Date >= DATE1 & household_power_consumption$Date <= DATE2,]

png("plot1.png")
hist((HP$Global_active_power), xlab="Global Active Power (Kilowatts)", col="red", main="Global Active Power")

dev.off()

