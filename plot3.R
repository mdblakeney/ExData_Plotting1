setwd("C:\\Users\\mblakeney\\Desktop\\CLASSES\\JH Data Science\\Data Science 4 - Exploratory Data Analysis\\Week 1 assignment\\ExData_Plotting1")

# DATA READ IN - COMMON TO ALL 4 PLOT FILES
# read in data file from parent folder of repo folder
x = read.table("..\\household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

# retain only those records from 2/1/2007 and 2/2/2007. This is easier to do 
# while the date field is still just text
x = subset(x, Date == "1/2/2007" | Date == "2/2/2007")

# Combine the date and time fields into one (text) datetime field, and remove 
# original fields
x = transform(x, datetime = paste(x$Date,x$Time))
x$Date = NULL
x$Time = NULL

# convert the datetime field into usable POSIXt format
x = transform(x, datetime = strptime(x$datetime, format="%d/%m/%Y %H:%M:%S"))
# END DATA READ IN SECTION

# Plot 3 - Sub-meter time series in different colors
png(file = "plot3.png")
plot(x$datetime,x$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab="")
lines(x$datetime,x$Sub_metering_1)
lines(x$datetime,x$Sub_metering_2, col="red")
lines(x$datetime,x$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black","red","blue"))
dev.off()