library(tidyverse)
library(lubridate)

# Read data into R
df <- read.table("household_power_consumption.txt", sep=';',header = TRUE )

# change date and time columns into classes
df$newtime <- with(df, dmy(Date) + hms(Time))
df$Date <- dmy(df$Date)
df$Time <- hms(df$Time)


# subset of data from dates 2007-02-01 and 2007-02-02.
day1 <- ymd("2007-02-01")
day2 <- ymd("2007-02-02")

df <- subset(df, df$Date==day1 | df$Date==day2)


# convert characters into numeric
df[,3:9] <- sapply(df[,3:9],as.numeric)
# clean up variables
rm(day1, day2)


# Plot 4 plot4.png
png(file="plot4.png",
    width=480,
    heigh=480)

par(mfrow=c(2,2), mar = c(4,4,4,5) )

#plot 4.1
plot(df$newtime, df$Global_active_power, type="l",
     ylab = "Global Active Power",
     xlab="")

#plot 4.2
plot(df$newtime, df$Voltage, type = "l", 
     ylab = "Voltage",
     xlab = "datetime")

# plot 4.3
plot(df$newtime, df$Sub_metering_1, type="l",
     ylab = "Energy sub metering",
     xlab="")
lines(df$newtime, df$Sub_metering_2, type="l", col="red")
lines(df$newtime, df$Sub_metering_3, type="l", col="blue")

legend("topright",
       lty = 1, 
       lwd = 1,
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))
       
# plot 4.4
plot(df$newtime, df$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power",
     xlab = "datetime")



dev.off()


