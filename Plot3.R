setwd("D:/Auto_formation/Coursera_Exploratory_Data_Analysis/Project 2")

# Importing The LIbrairies
library(tidyr)
library(ggplot2)

# Importing The Dataset
Dataset <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting The baltimore City's Emissions
Em_Baltimore <- subset(Dataset, fips == "24510")

#Calculating the total emission for each year and for each type
totalEm_bal_type <- aggregate(Emissions ~ year + type, Em_Baltimore, sum)

#Plotting The Baltimore emission by year and type
ggplot(totalEm_bal_type, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle("Total PM2.5 Emissions by Type and Year in Baltimore City") +
  ylab(expression("Total PM2.5 Emissions in Baltimore City")) +
  xlab("Year") +
  scale_colour_discrete(name = "Type of sources")+
  theme(plot.title = element_text(hjust = 0.5))

# Save file and close device
dev.copy(png,"Plot3.png", width=480, height=480)
dev.off()