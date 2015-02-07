hpc <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
my_hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
my_hpc$Sub_metering_1 <- as.numeric(levels(my_hpc$Sub_metering_1))[my_hpc$Sub_metering_1]
my_hpc$Sub_metering_2 <- as.numeric(levels(my_hpc$Sub_metering_2))[my_hpc$Sub_metering_2]
Sys.setlocale("LC_ALL", "en_US")
my_hpc$datetime <- paste(my_hpc$Date, my_hpc$Time)
my_hpc$datetime <- strptime(my_hpc$datetime, "%d/%m/%Y %H:%M:%S", tz ="")
png("plot3.png", height = 480, width = 480)
par(mfrow = c(1,1), oma = c(2,2,2,2), cex = 0.75)
with(my_hpc, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n" ))
with(my_hpc, points(datetime, Sub_metering_1, type = "l", col = "black" ))
with(my_hpc, points(datetime, Sub_metering_2, type = "l", col = "red" ))
with(my_hpc, points(datetime, Sub_metering_3, type = "l", col = "blue" ))
legend("topright", lty = c(1,1,1), lwd = c(1, 1, 1), col = c("black", "red", "blue"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()