household_power_consumption <- read.csv("~/R Projects Coursera/Exploratory Data Anlysis/household_power_consumption.txt", sep=";")
##convert to df for simplicity
df <- household_power_consumption
##Convert times as character into posiXlt
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
##select the correct days
df.dates <- df[df$DateTime >= "2007-02-01" & df$DateTime <= "2007-02-03",]
##Remove NAs
df <- df.dates[complete.cases(df.dates$Date),]
##Create plot matrix to import into
par(mfrow = c(2,2))
par(mar=c(1,1,1,1))
##add plot 1
with(df, plot(DateTime, Global_active_power, ylab = "Global Active Power", xlab = " ", type = "l"))
##add plot 2
with(df, plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l"))
##add plot 3
with(df, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = " ", type = "l"))
##add sub 2 and 3 with the lines function
lines(df$DateTime, df$Sub_metering_3, col="blue")
lines(df$DateTime, df$Sub_metering_2, col="red")
##add legend
legend("topright", pch = "---", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.35)
##add plot 4
with(df, plot(DateTime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l"))
##Copy as png and save as plot4.png
dev.copy(png, "plot4.png", width = 480, height = 480)
##close copier
dev.off()

rm(list = ls())