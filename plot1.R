#clear environment at the start of the run
rm(list = ls(all.names = TRUE))

# Dataset object creation
##Power_Consumption_dataset <- read.table("D:/Dropbox/Currículum Vitae/Data Scientist/Graphics/household_power_consumption.txt", header = TRUE, sep = ";")
Power_Consumption_dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# picking subset
relevant_timeframe <- subset(Power_Consumption_dataset, Power_Consumption_dataset$Date == "1/2/2007" | Power_Consumption_dataset$Date == "2/2/2007")

# formating subset data
relevant_timeframe$Time <- paste(relevant_timeframe$Date, relevant_timeframe$Time, sep = " ")
relevant_timeframe$Date <- as.Date(relevant_timeframe$Date, format="%d/%m/%Y")
relevant_timeframe$Time <- strptime(relevant_timeframe$Time, format = "%d/%m/%Y %H:%M:%S")

relevant_timeframe$Global_active_power <- as.numeric(relevant_timeframe$Global_active_power)
relevant_timeframe$Global_reactive_power <- as.numeric(relevant_timeframe$Global_reactive_power)
relevant_timeframe$Voltage <- as.numeric(relevant_timeframe$Voltage)
relevant_timeframe$Global_intensity <- as.numeric(relevant_timeframe$Global_intensity)
relevant_timeframe$Sub_metering_1 <- as.numeric(relevant_timeframe$Sub_metering_1)
relevant_timeframe$Sub_metering_2 <- as.numeric(relevant_timeframe$Sub_metering_2)
relevant_timeframe$Sub_metering_3 <- as.numeric(relevant_timeframe$Sub_metering_3)

# creating the histogram
png("plot1.png")
hist(relevant_timeframe$Global_active_power, col = "red", main = "Global Active Power Histogram", xlab = "GAP [kW]")
mtext("* Observations of minute-averaged kW *", side = 3, line = -1, cex = 0.8)
dev.off()