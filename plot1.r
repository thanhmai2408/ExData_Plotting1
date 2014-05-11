df <- read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE,colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),)                                                        
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df <- df[as.Date(df$DateTime)==as.Date("2007-02-01") | as.Date(df$DateTime) == as.Date("2007-02-02"), ]
png(filename = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()