household_power_consumption <- read.csv("~/R Projects Coursera/Exploratory Data Anlysis/household_power_consumption.txt", sep=";")
##convert to df for simplicity
df <- household_power_consumption
##Convert times as character into posiXlt
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
##select the correct days
df.dates <- df[df$DateTime >= "2007-02-01" & df$DateTime <= "2007-02-03",]
##Remove NAs
df <- df.dates[complete.cases(df.dates$Date),]
##Plot in with
with(df, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = " ", type = "l"))
##add sub 2 and 3 with the lines function
lines(df$DateTime, df$Sub_metering_3, col="blue")
lines(df$DateTime, df$Sub_metering_2, col="red")
##add legend
legend("topright", pch = "---", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.35)
##Copy as png and save as plot3.png
dev.copy(png, "plot3.png", width = 480, height = 480)
##close copier
dev.off()

rm(list = ls())