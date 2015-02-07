hpc <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
my_hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
my_hpc$Global_active_power <- as.numeric(levels(my_hpc$Global_active_power))[my_hpc$Global_active_power]
Sys.setlocale("LC_ALL", "en_US")
my_hpc$datetime <- paste(my_hpc$Date, my_hpc$Time)
my_hpc$datetime <- strptime(my_hpc$datetime, "%d/%m/%Y %H:%M:%S", tz ="")
with(my_hpc, plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", pch = "", type = "l" ))
dev.copy(png, file = "plot2.png")
dev.off()