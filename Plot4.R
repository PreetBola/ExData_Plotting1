setwd("C://Users//MAIN USER//Desktop//Data Science Specialization-Coursera//Exploratory Data Analysis//Assignment 1")
fileName <- paste(getwd(),".//data//household_power_consumption.txt",sep="")

#getting the target data together
temp <- read.csv(fileName,sep=";",nrows=1)
varNames <- colnames(temp)

#Reading only first two days of Feburary
tData <- read.csv(fileName,sep=";",header=FALSE, nrows=2880, skip=66637) 
colnames(tData) <- varNames

#Adding the DateTime Class column
fData <- data.frame(dateTime=strptime(paste(tData[,1],tData[,2],sep=" "),format="%d/%m/%Y %H:%M:%S"))
fData <- cbind(tData[,1:2],fData,tData[,3:9])

#Creating our plot
png(filename="Plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2),mar=c(4,4,2,1)) #2 plots per row with total 2 rows (filled row-wise)

with(fData,{
	#1st plot
	with(fData,plot(dateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (killowatts)"))

	#2nd plot
	with(fData,plot(dateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

	#third plot
	with(fData,plot(dateTime,Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering"))
	with(fData,lines(dateTime,Sub_metering_2,type="l",xlab="",ylab="Energy Sub metering",col="red"))
	with(fData,lines(dateTime,Sub_metering_3,type="l",xlab="",ylab="Energy Sub metering",col="blue"))
	legend("topright",lty="solid",seg.len=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

	#4th plot
	with(fData,plot(dateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power"))
})
dev.off()