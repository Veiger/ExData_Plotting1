library("data.table")

df <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")
df[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
df <- df[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)

# Plot 2
plot(x = df[, dateTime]
     , y = df[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
