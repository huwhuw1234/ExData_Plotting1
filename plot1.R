##import data set
household_power_consumption <- read.csv("~/R Projects Coursera/Exploratory Data Anlysis/household_power_consumption.txt", sep=";")
##convert to df for simplicity
df <- household_power_consumption
##Convert times as character into posiXlt
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
##select the correct days
df.dates <- df[df$DateTime >= "2007-02-01" & df$DateTime <= "2007-02-03",]
##Remove NAs
df <- df.dates[complete.cases(df.dates$Date),]
##Create histogram with red colour and correct labels
hist(as.numeric(df$Global_active_power), xlab = "Global Active Power (kilowatts)", col  = "red", 
     main = "Global Active Power")
##Copy as png and save as plot1.png
dev.copy(png, "plot1.png", width = 480, height = 480)
##close copier
dev.off()

rm(list = ls())