pc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?",stringsAsFactors = FALSE)
hpc$Date<-as.Date(hpc$Date, "%d/%M/%Y")
subsethpc <- subset(hpc,Date >="2007-02-01" & Date<="2007-02-02")
subsethpc$newdate <- with(subsethpc, strptime(paste(subsethpc$Date,subsethpc$Time), format = '%Y-%m-%d %H:%M'))

par(pch=22, col="black") # plotting symbol and color 
par(mfrow=c(1,1)) # all plots on one page 
plot(subsethpc$newdate,subsethpc$Global_active_power, type="l",  xlab="", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off()