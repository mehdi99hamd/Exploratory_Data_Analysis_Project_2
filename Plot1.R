setwd("D:/Auto_formation/Coursera_Exploratory_Data_Analysis/Project 2")

# Importing The LIbrairies
library(tidyr)

# Importing The Dataset
Dataset <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculating the total emission for each year
totalEm <- aggregate(Emissions ~ year, Dataset, sum)

#plotting the total emission for each year
plot(totalEm$year, totalEm$Emissions, type = 'o', col = "blue", main = "Total US PM2.5 Emissions by Year", 
     ylab = expression("Total US PM2.5 Emissions"), xlab = "Year")


# Save file and close device
dev.copy(png,"Plot1.png", width=480, height=480)
dev.off()


