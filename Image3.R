#-- ------------------------------------------------------
# Author: Gary Fay
# Class: R Exploratory Data Analysis
# March 2015


library(sqldf)
library(ggplot2)

#Question 3 Baltimore pm2
## Load data. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("./data/exdata_data_NEI_data/summarySCC_PM25.rds")
}

rslt3 = sqldf('select sum(emissions) as Emissions, year, type from NEI where fips = 24510 group by year, type order by year, type')


png('./images/plot3.png', width=650, height=480)
p <- ggplot(rslt3, aes(x=year, y=Emissions, colour=type)) 
p <- p + geom_line()+xlab('year')  
p <- p + ggtitle('Total Emissions Baltimore 1999-2008')


print(p)
dev.off()  

