hpc <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
my_hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
gap <- as.numeric(levels(my_hpc$Global_active_power))[my_hpc$Global_active_power]
hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()