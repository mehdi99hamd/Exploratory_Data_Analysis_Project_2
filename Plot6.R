setwd("D:/Auto_formation/Coursera_Exploratory_Data_Analysis/Project 2")

# Importing The LIbrairies
library(tidyr)
library(ggplot2)

# Importing The Dataset
Dataset <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting The baltimore City and Los Angeles Emissions from motor vehicle
Em_Mtr <- subset(Dataset,  type == "ON-ROAD" & fips %in% c("24510","06037"))

#Calculating the total emission for each year and for each city
totalEm_Mtr <- aggregate(Emissions ~ year + fips, Em_Mtr, sum)

#Plotting The total emission by year and city
ggplot(totalEm_Mtr, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle("Total PM2.5 Emissions by Year and by City from motor vehicule") +
  ylab(expression("Total PM2.5 Emissions from motor vehicule")) +
  xlab("Year") +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore"))+
  theme(plot.title = element_text(hjust = 0.5))

# Save file and close device
dev.copy(png,"Plot6.png", width=480, height=480)
dev.off()