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


# Plot 3 plot3.png
png(file="plot2.png",
    width=480,
    heigh=480)
 
plot(df$newtime, df$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab="")
dev.off()


