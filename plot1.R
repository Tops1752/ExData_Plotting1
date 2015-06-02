
## Read data from the dates 2007-02-01 and 2007-02-02 

fn<-"household_power_consumption.txt"

data<-read.table(fn,sep = ";",
                 header = TRUE,
                 skip = 66636,
                 nrows = 2880,
                 col.names = c("Date","Time","Global_active_power","Global_reactive_power",
                               "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
                 )

## Add another column of date-time

DateTime <- strptime(paste(data$Date,data$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

data$DateTime <- DateTime

## create png file, plot and close file

png("./ExData_Plotting1/plot1.png",width = 480, height = 480)

hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
)

dev.off()


