# Plot 1

# Reading the data from text file into a data frame using read.table
data_frame  <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
# Change format of date
data_frame$Date <- as.Date(data_frame$Date, format="%d/%m/%Y")

# Subset of data from the dates 2007-02-01 and 2007-02-02.
subset_df <- data_frame[data_frame$Date =="2007-02-01" | data_frame$Date =="2007-02-02", ]

# Histogram for Gblobal Active Power
hist(subset_df$Global_active_power, main="Global Active Power",  
     xlab="Global Active Power  (kilowatts)", ylab="Frecuency",
     col="red")
#title( main="Global Active Power")

# Saving the plot to png file
dev.copy(png, file = "./plot1.png", width=480, height=480) 
dev.off()  # close the PNG device
