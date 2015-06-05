#Plot2.R
###################
myfile <- "data/household_power_consumption.txt"
hpc <- read.delim(myfile, header=T, sep=";", na.string="?")
subhpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
rm(hpc)

subhpc$Date <- as.Date(subhpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subhpc$Date), subhpc$Time)
subhpc$Datetime <- as.POSIXct(datetime)

plot(subhpc$Global_active_power~subhpc$Datetime, type="l",
xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
rm(subhpc)

###################