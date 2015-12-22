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
png(filename="Plot2.png",width=480,height=480,units="px")
with(fData,plot(dateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (killowatts)"))
dev.off()