#-- ------------------------------------------------------
# Author: Gary Fay
# Class: R Exploratory Data Analysis
# March 2015


library(sqldf)
library(ggplot2)

# Question 5 Motor Vehicle emmissions
# NEI$type=="ON-ROAD", ]

if(!exists("NEI_SCC")){
  NEI_SCC <- readRDS("./data/exdata_data_NEI_data/NEI_SCC.rds")
}
rslt5 = sqldf("select sum(emissions) as Emissions, year, type from NEI where type='ON-ROAD' and fips = '24510' group by year, type order by year, type")

png("./images/plot5.png", width=840, height=580)
g <- ggplot(rslt5, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()
 