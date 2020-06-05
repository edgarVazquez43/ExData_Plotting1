# Plot 3

# Reading the data from text file into a data frame using read.table
data_frame  <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Change format of date
data_frame$Date <- as.Date(data_frame$Date, format="%d/%m/%Y")

# Subset of data from the dates 2007-02-01 and 2007-02-02.
subset_df <- data_frame[data_frame$Date =="2007-02-01" | data_frame$Date =="2007-02-02", ]

subset_df$Datetime <- paste(as.Date(subset_df$Date), subset_df$Time)
subset_df$Datetime <- as.POSIXct(subset_df$Datetime, tz = "America/Los_Angeles")

# Plots for submetering
plot(subset_df$Sub_metering_1 ~ subset_df$Datetime,   
     type = "l",
     xlab = "",
     ylab = "Energy sub metering"
     )

lines(subset_df$Sub_metering_2 ~ subset_df$Datetime,   
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col  = "red"
     )

lines(subset_df$Sub_metering_3 ~ subset_df$Datetime,   
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col  = "blue"
)

# Plotting the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"), lty = 1)

# Saving the image
dev.copy(png, file = "./plot3.png", width=480, height=480) 
dev.off()  # close the PNG device