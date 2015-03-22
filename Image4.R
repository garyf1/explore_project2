#-- ------------------------------------------------------
# Author: Gary Fay
# Class: R Exploratory Data Analysis
# March 2015


library(sqldf)
library(ggplot2)


#Question 4 Coal Combustion across the us
if(!exists("NEI_SCC")){
  NEI_SCC <- readRDS("./data/exdata_data_NEI_data/NEI_SCC.rds")
}

rslt4 = sqldf("select sum(emissions) as Emissions, year from NEI_SCC where ShortName like '%Coal%' group by year order by year ")


png("./images/plot4.png", width=640, height=480)
g <- ggplot(rslt4, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
