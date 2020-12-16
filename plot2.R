household_power_consumption <- read.csv("~/R Projects Coursera/Exploratory Data Anlysis/household_power_consumption.txt", sep=";")
##convert to df for simplicity
df <- household_power_consumption
##Convert times as character into posiXlt
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
##select the correct days
df.dates <- df[df$DateTime >= "2007-02-01" & df$DateTime <= "2007-02-03",]
##Remove NAs
df <- df.dates[complete.cases(df.dates$Date),]
##Plot with line
with(df, plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = " ", type = "l"))
##Copy as png and save as plot2.png
dev.copy(png, "plot2.png", width = 480, height = 480)
##close copier
dev.off()

rm(list = ls())