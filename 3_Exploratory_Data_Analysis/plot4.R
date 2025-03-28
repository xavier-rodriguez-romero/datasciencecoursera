# Load the dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?", stringsAsFactors = FALSE)

# Subset to the 2 days
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert to datetime
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time), 
                                 format="%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(subset_data$Datetime, subset_data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

plot(subset_data$Datetime, subset_data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

plot(subset_data$Datetime, subset_data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subset_data$Datetime, subset_data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

