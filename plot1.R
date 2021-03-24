## =====================================================
## Exploratory Data Analysis Week 1 Assignment - Plot 1
## Submission by Ming Qiu
## =====================================================

# ====================
# Preparing the data
# ====================
setwd("~/Desktop/Coursera_R/Exploratory_Data_Analysis/wk1_Assignment")
unzip("exdata_data_household_power_consumption.zip")
Filename <- "household_power_consumption.txt"
data <- read.table(Filename, stringsAsFactors = FALSE, header = TRUE, sep =";")
# Convert variables to correct classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- format(data$Time, format = "%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
# Subsetting data
data_sub <- subset(data, Date == "2007-02-01"| Date == "2007-02-02")

# ==============
# Plot 1
# ==============
png("plot1.png", width=480, height=480)
hist(data_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
