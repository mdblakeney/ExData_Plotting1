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

# Plot 1 - Pretty Red Histogram
png(file = "plot1.png")
hist(x$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()