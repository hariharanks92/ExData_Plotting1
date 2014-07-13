data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";")

data <- sqldf(x='select * from data where Date in ("1/2/2007", "2/2/2007")')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

par(mar=c(4,4,1,1))

png("plot1.png",height=480, width=480)

hist(x=data$Global_active_power,
     xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")

dev.off()
