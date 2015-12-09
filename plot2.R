##################################################################################################
##################################################################################################
##################################################################################################
#########               Course Project 2  - Plot2.R                       ########################
##################################################################################################
##################################################################################################
##################################################################################################


##  Set Working Directory
setwd("C:/Users/Andrew/Desktop/Data Science Course/Exploratory Data Analysis/Course Project 2")

##  Read in files
if(!exists("NEI")){
  NEI <- readRDS("./Project 2 Data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Project 2 Data/Source_Classification_Code.rds")
}

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('Total PM'[2.5]*' Emission'),main=expression('Total PM'[2.5]*' Emissions in the Baltimore City, MD by Year'))
dev.off()