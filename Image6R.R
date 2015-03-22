#-- ------------------------------------------------------
# Author: Gary Fay
# Class: R Exploratory Data Analysis
# March 2015


library(sqldf)
library(ggplot2)


# Question 6 motor vehicle emissions baltimore vs la (06037)
if(!exists("NEI_SCC")){
  NEI_SCC <- readRDS("./data/exdata_data_NEI_data/NEI_SCC.rds")
}
#   NEI[ fips=="24510"  fips=="06037") type=="ON-ROAD", ]
rslt6 = sqldf("select sum(emissions) as Emissions, year, fips from NEI where type='ON-ROAD' and ( fips = '24510' or fips='06037' ) group by year, fips order by year, fips")


png("./images/plot6.png", width=1040, height=480)
g <- ggplot(rslt6, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity") +
  xlab("LA Increased Road Emissions  -Year- Baltimore Decreased Road Emmissions") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037") 1999-2008')
print(g)
dev.off()