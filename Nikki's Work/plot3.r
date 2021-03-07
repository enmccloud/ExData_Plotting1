## Nikki McCloud
## Coursera 
## Exploratory Data Analysis w/ R
## Electric Power Consumption Project 1
## 3/07/2021

## locating/Reading file
setwd ("C:/Users/soupy/Downloads/exdata_data_household_power_consumption/")

filename <- "household_power_consumption.txt"

##Provide table summary
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
summary(data)

## Generating first 5 rows & headers
initial<-read.table("household_power_consumption.txt", header=TRUE,sep=";", nrows=5)

## Reading 29,000 rows for data between 2/1/07 - 2/2/07
hpc<-read.table("household_power_consumption.txt", header=TRUE,sep=";", skip=66630, 
                nrows=2900, col.names=names(initial), na.strings=c("?"),
                colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                             "numeric","numeric","numeric"))

## Convert to Date/Time format
hpc$Date<-as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Time<-strptime(paste(hpc$Date,hpc$Time),"%F %T")

## Subset the data
hpc<-subset(hpc,hpc$Date %in% as.Date(c("2007-02-01","2007-02-02")))

## Plot 3 - Energy Meter
par(mfrow=c(1,1),mar=c(4,4,4,2))
plot(hpc$Time,hpc$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(hpc$Time,hpc$Sub_metering_2, col="red", type="l")
points(hpc$Time,hpc$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(hpc[,7:9]))

png("plot3.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(4,4,4,2))
plot(hpc$Time,hpc$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(hpc$Time,hpc$Sub_metering_2, col="red", type="l")
points(hpc$Time,hpc$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(hpc[,7:9]))
dev.off()
