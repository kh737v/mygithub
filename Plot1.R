#Plot1.R
###################
myfile <- "data/household_power_consumption.txt"
hpc <- read.delim(myfile, header=T, sep=";", na.string="?")
subhpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]

install.packages("pryr")
library(pryr)
object_size(hpc)
object_size(subhpc)

rm(hpc)

hist(subhpc$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
rm(subhpc)

###################