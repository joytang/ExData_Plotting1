# Coursera EDA Course Project 1
# Plot 1
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
summary(df.2day)

# Plot ####
png('plot1.png', width=480, height=480)
hist(df.2day$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
