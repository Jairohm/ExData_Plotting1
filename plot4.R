#1.Downloading the file
if (!file.exists("data")) {
        dir.create("data")
}
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./data/electric.zip")
unzip("./data/electric.zip",exdir = "./data/")


#2.Reading the dataset
dat <- read.table("./data/household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE, skip = 66637, nrows = 2880, header = FALSE, col.names = c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#3.Plotting
datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(dat$Global_active_power)
voltage <- as.numeric(dat$Voltage)
globalReactivePower <- as.numeric(dat$Global_reactive_power)
sub1 <- as.numeric(dat$Sub_metering_1)
sub2 <- as.numeric(dat$Sub_metering_2)
sub3 <- as.numeric(dat$Sub_metering_3)

png(filename = "plot4.png")
par(mfrow=c(2, 2))

plot(datetime, globalActivePower, type="l",xlab = "", ylab = "Global Active Power (Kilowatts)")

plot(datetime, voltage, type = "l",xlab="datetime", ylab = "Voltage")

plot(datetime, sub1, type="l",xlab = "", ylab = "Energy sub metering")
lines(datetime, sub2, col="red")
lines(datetime, sub3, col="blue")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty =, lwd = 1.5, col = c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()