pc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?",stringsAsFactors = FALSE)
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")
subsethpc <- subset(hpc,Date >="2007-02-01" & Date<="2007-02-02")
subsethpc$newdate <- with(subsethpc, strptime(paste(subsethpc$Date,subsethpc$Time), format = '%Y-%m-%d %H:%M'))

par(mfrow=c(2,2)) # all plots on one page 
plot(subsethpc$newdate,subsethpc$Global_active_power, type="l",  xlab="", ylab = "Global Active Power (kilowatts)")
plot(subsethpc$newdate,subsethpc$Voltage, type="l",  xlab="", ylab = "Voltage")

plot(subsethpc$newdate,subsethpc$Sub_metering_1, type="l" , col = "black", ylim = c(0,30), ylab = "Energy sub metering", xlab = "")
lines(subsethpc$newdate,subsethpc$Sub_metering_2, col = "red")
lines(subsethpc$newdate,subsethpc$Sub_metering_3, col = "blue")
legend("topright", pch = 1, col = c("black", "red", "blue"),       
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(subsethpc$newdate,subsethpc$Global_reactive_power, type="l",  xlab="", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off()