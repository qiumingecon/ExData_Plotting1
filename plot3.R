## =====================================================
## Exploratory Data Analysis Week 1 Assignment - Plot 3
## Submission by Ming Qiu
## =====================================================

# ====================
# Preparing the data
# ====================
setwd("~/Desktop/Coursera_R/Exploratory_Data_Analysis/wk1_Assignment")
unzip("exdata_data_household_power_consumption.zip")
Filename <- "household_power_consumption.txt"
# Reading the TXT file into R; set the characters of the first row as column names 
Colnames <- scan(text = readLines(Filename,1), sep = ";", what = "", quiet = TRUE)
data <- read.table(Filename, sep = ";", col.names = Colnames, skip = 1)
# Create a Time variable to be plotted on
data$TimeCombo <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
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
# Plot 3
# ==============
png("plot3.png", width = 480, height = 480)
plot(data_sub$TimeCombo, data_sub$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data_sub$TimeCombo, data_sub$Sub_metering_2, col = "red")
lines(data_sub$TimeCombo, data_sub$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty= 1, lwd=2)
dev.off()



