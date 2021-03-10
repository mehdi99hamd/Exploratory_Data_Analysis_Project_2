setwd("D:/Auto_formation/Coursera_Exploratory_Data_Analysis/Project 2")

# Importing The LIbrairies
library(tidyr)

# Importing The Dataset
Dataset <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting The baltimore City's Emissions
Em_Baltimore <- subset(Dataset, fips == "24510")

#Calculating the total emission for each year
totalEm_bal <- aggregate(Emissions ~ year, Em_Baltimore, sum)

#plotting the total emission for each year
plot(totalEm_bal$year, totalEm_bal$Emissions, type = 'o', col = "blue", main = "Total PM2.5 Emissions by Year in Baltimore City", 
     ylab = expression("Total PM2.5 Emissions in Baltimore City"), xlab = "Year")

# Save file and close device
dev.copy(png,"Plot2.png", width=480, height=480)
dev.off()