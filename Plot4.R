setwd("D:/Auto_formation/Coursera_Exploratory_Data_Analysis/Project 2")

# Importing The LIbrairies
library(tidyr)
library(ggplot2)

# Importing The Dataset
Dataset <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting The Emissions from coal combustion-related in the US 
SCC_coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
Em_coal <- Dataset[Dataset$SCC %in% SCC_coal$SCC,]

#Calculating the total emission for each year and for each type
totalEm_col <- aggregate(Emissions ~ year, Em_coal, sum)

#Plotting The Baltimore emission by year and type
ggplot(totalEm_col, aes(year, Emissions)) +
  geom_line() +
  geom_point() +
  ggtitle("Total US PM2.5 Emissions from coal combustion-related by year") +
  ylab(expression("Total US PM2.5 Emissions from coal combustion-related")) +
  xlab("Year") +
  theme(plot.title = element_text(hjust = 0.5))

# Save file and close device
dev.copy(png,"Plot4.png", width=480, height=480)
dev.off()
