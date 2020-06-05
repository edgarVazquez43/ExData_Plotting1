# Plot 2
# I had some throubles with the time zone of my computher
# That's why the weekday are in Spanish instead of English Im sorry for that.

# Reading the data from text file into a data frame using read.table
data_frame  <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Change format of date
data_frame$Date <- as.Date(data_frame$Date, format="%d/%m/%Y")

# Subset of data from the dates 2007-02-01 and 2007-02-02.
subset_df <- data_frame[data_frame$Date =="2007-02-01" | data_frame$Date =="2007-02-02", ]

subset_df$Datetime <- paste(as.Date(subset_df$Date), subset_df$Time)
subset_df$Datetime <- as.POSIXct(subset_df$Datetime, tz = "America/Los_Angeles")

# Line plot for Gblobal Active Power
plot(subset_df$Global_active_power ~ subset_df$Datetime,   
     type = "l",
     xlab = "",
     ylab = "Global Active Power  (kilowatts)"
     )

# Saving the image
dev.copy(png, file = "./plot2.png", width=480, height=480) 
dev.off()  # close the PNG device