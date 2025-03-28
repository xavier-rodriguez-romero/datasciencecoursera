# Load the dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?", stringsAsFactors = FALSE)

# Subset to the 2 days
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert to datetime
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time), 
                                 format="%d/%m/%Y %H:%M:%S")

png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
