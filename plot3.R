# exdata-010 Coursera course
# Project 1 - Plot 3
# Assignment details here: https://class.coursera.org/exdata-010/human_grading/view/courses/973504/assessments/3/submissions
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, nrows = 50, na.strings = "?")
classes <- sapply(data, class)
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses = classes, na.strings = "?")
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
date1 = as.Date("2007-02-01", "%Y-%m-%d")
date2 = as.Date("2007-02-02", "%Y-%m-%d")
selected <- subset(data, data$Date == date1 | data$Date == date2, select = Date:Sub_metering_3)
rm("data")
data <- selected
rm("selected")
png("plot3.png", width = 480, height = 480, units = "px")
plot(data$Time, data$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab=NA, col = "black")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bg="white")
dev.off()
