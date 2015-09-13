#1.Downloading the file
if (!file.exists("data")) {
        dir.create("data")
}
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./data/electric.zip")
unzip("./data/electric.zip",exdir = "./data/")


#2.Reading the dataset
dat <- read.table("./data/household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE, skip = 66637, nrows = 2880, header = FALSE, col.names = c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#3.Plotting
png(filename = "plot1.png")
hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()