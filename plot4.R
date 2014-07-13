data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";")

data <- sqldf(x='select * from data where Date in ("1/2/2007", "2/2/2007")')
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

data$date_time <- paste(data$Date, data$Time, sep= " ")
data$date_time <- strptime(data$date_time, "%Y-%m-%d %H:%M:%S")

# data <- data[complete.cases(data),]


png("plot4.png",height=480, width=480)

par(mfrow=c(2,2))

with(data, {

    #     ******************plot1*********************
    
     with(data, plot(date_time, Global_active_power, type="l", 
                     ylab="Global Active Power (kilowatts)"))

    #     ******************plot2*********************
     
     with(data, plot(date_time, Voltage, type="l", ylab="Voltage"))
     
    #     ******************plot3*********************
    
     with(data=data, plot(date_time,Sub_metering_1,col="grey",type="l", 
                          ylab="Energy sub metering"))
     with(data=data, lines(x=date_time, y=Sub_metering_2, col="green"))
     with(data=data, lines(x=date_time, y=Sub_metering_3, col="blue"))
     legend("topright",pch="-", col=c("grey","green","blue"),
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            cex=1)
     
    #     ******************plot4*********************
    
    with(data, plot(date_time, Global_reactive_power, type="l", 
                    ylab="Global Reactive Power (kilowatts)"))
         
}
     )

dev.off()