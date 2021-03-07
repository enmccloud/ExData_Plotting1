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

## Plot 2 - Global Active Consumption over a period
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
plot(hpc$Time,hpc$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", pch =".", type="l")

png("plot2.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
plot(hpc$Time,hpc$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", pch =".", type="l")
dev.off()
