#clear environment at the start of the run
rm(list = ls(all.names = TRUE))

# Dataset object creation
##Power_Consumption_dataset <- read.table("D:/Dropbox/Currículum Vitae/Data Scientist/Graphics/household_power_consumption.txt", header = TRUE, sep = ";")
download.file(url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'household_power_consumption.zip', method = 'curl')
unzip(zipfile = "household_power_consumption.zip", exdir = getwd())
Power_Consumption_dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
file.remove("household_power_consumption.txt")
file.remove("household_power_consumption.zip")

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

# creating the plot
png("plot2.png")
plot(relevant_timeframe$Time, relevant_timeframe$Global_active_power, type = "l", main = "Global Active Power Over Time", ylab = "GAP [kW]", xlab = "Date & Time")
mtext("* Chronological Variation of Global Active Power *", side = 3, line = 0.5, cex = 0.8)
dev.off()