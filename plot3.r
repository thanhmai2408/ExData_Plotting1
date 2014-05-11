df <- read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE,colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),)   
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df <- df[as.Date(df$DateTime)==as.Date("2007-02-01") | as.Date(df$DateTime) == as.Date("2007-02-02"), ]
png(filename = "plot3.png", width = 480, height = 480)
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, type="l", col="red")
lines(df$DateTime, df$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()