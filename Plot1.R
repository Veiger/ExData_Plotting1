library("data.table")

df <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

df[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
df <- df[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("plot1.png", width=480, height=480)

# Plot 1
hist(df[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
