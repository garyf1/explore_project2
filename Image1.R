#-- ------------------------------------------------------
# Author: Gary Fay
# Class: R Exploratory Data Analysis
# March 2015


library(sqldf)
library(ggplot2)

## Load data. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("./data/exdata_data_NEI_data/summarySCC_PM25.rds")
}

# question one US pm2
rslt = sqldf('select sum(emissions) as Emissions, year from NEI group by year order by year')
png("./images/plot1.png", width=640, height=480)
barplot( height=rslt$Emissions, names=rslt$year ,
         xlab='US PM2 Emissions Years', ylab='Tons Pm2.5',
         main="Annual US PM2 Emmissions 1999-2008")
dev.off()  
