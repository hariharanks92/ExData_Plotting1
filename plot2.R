data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";")

data <- sqldf(x='select * from data where Date in ("1/2/2007", "2/2/2007")')
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$date_time <- paste(data$Date, data$Time, sep= " ")

data$date_time <- strptime(data$date_time, "%Y-%m-%d %H:%M:%S")

# data <- data[complete.cases(data),]

par(mar=c(2,4,1,1))

png("plot2.png",height=480, width=480)

with(data, plot(date_time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

dev.off()
