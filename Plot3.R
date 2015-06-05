#Plot3.R
###################
myfile <- "data/household_power_consumption.txt"
hpc <- read.delim(myfile, header=T, sep=";", na.string="?")
subhpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
rm(hpc)

subhpc$Date <- as.Date(subhpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subhpc$Date), subhpc$Time)
subhpc$Datetime <- as.POSIXct(datetime)

with(subhpc,{
  plot(Sub_metering_1~Datetime, type="l",xlab="",ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  })
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      )
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
rm(subhpc)

###################