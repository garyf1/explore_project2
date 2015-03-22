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

#Question 2 Baltimore pm2
rslt2 = sqldf('select sum(emissions) as Emissions, year from NEI where fips = 24510 group by year order by year')
png("./images/plot2.png", width=640, height=480)
barplot( height=rslt2$Emissions, names=rslt2$year ,
         xlab='Baltimore PM2 Emissions Years', ylab='Tons Pm2.5',
         main="Annual Baltimore PM2 Emmissions 1999-2008")
dev.off()  

