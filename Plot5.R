setwd("D:/Auto_formation/Coursera_Exploratory_Data_Analysis/Project 2")

# Importing The LIbrairies
library(tidyr)
library(ggplot2)

# Importing The Dataset
Dataset <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting The baltimore City's Emissions from motor vehicule
Em_Baltimore_Mtr <- subset(Dataset, fips == "24510" & type == "ON-ROAD")

#Calculating the total emission for each year and for each type
totalEm_bal_Mtr <- aggregate(Emissions ~ year, Em_Baltimore_Mtr, sum)

#Plotting The Baltimore emission by year and type
ggplot(totalEm_bal_Mtr, aes(year, Emissions)) +
  geom_line() +
  geom_point() +
  ggtitle("Total PM2.5 Emissions by Year in Baltimore City from motor vehicule") +
  ylab(expression("Total PM2.5 Emissions in Baltimore City from motor vehicule")) +
  xlab("Year") +
  theme(plot.title = element_text(hjust = 0.5))

# Save file and close device
dev.copy(png,"Plot5.png", width=480, height=480)
dev.off()