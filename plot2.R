# Coursera EDA Course Project 1
# Plot 2
rm(list=ls())
library(data.table)
library(dplyr)

# Read in Data ####
df <- fread('household_power_consumption.txt', 
            sep = ';', header = T, na.strings = '?',
            stringsAsFactors = F, data.table = F)
df <- df %>% mutate(
  Date = as.Date(Date, format = "%d/%m/%Y")
)
summary(df)

# Subset ####
df.2day <- df %>% filter (
  Date >= '2007-02-01' & Date <= '2007-02-02'
) 
 
df.2day$date_time = strptime(paste(df.2day$Date, df.2day$Time), "%Y-%m-%d %H:%M:%S")
summary(df.2day)

# Plot ####
png('plot2.png', width=480, height=480)
plot(df.2day$date_time, df.2day$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()