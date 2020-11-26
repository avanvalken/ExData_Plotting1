library(tidyverse)
library(lubridate)

# Read data into R
df <- read.table("household_power_consumption.txt", sep=';',header = TRUE )
#dfc <- df
# change date and time columns into classes
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


# Plot 1 plot1.png
png(file="plot1.png",
    width=480,
    heigh=480)
hist(df$Global_active_power, 
     col = "red", 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()


