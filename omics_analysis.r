 # Import dependences
 library("readxl")
 library(tidyverse)
 library(dplyr)
 
 # Read in the data
my_data <- read_excel("~/Desktop/DataLand/r5_Omics_Analysis_Deployment/pgen.1008897.s004.xlsx") 

# check column names of data
colnames(my_data)

# Preview dataset
my_data

# create column; default value is "not significant"
my_data["group"] <- "Not_Significant"

# For the plot only highlight 
# p-value <0.05 and Fold Change > 1.5

# change the grouping for the entries with significance but not large enough fold change
my_data[which(my_data['- log (p-value)'] < 0.05 & abs(my_data['Students t-test difference (Ctx vs LonA)']) < 1.5), "group"] <- "Significant"

# change the grouping for the entries a large enough Fold change but not a low enough p value
my_data[which(my_data['- log (p-value)'] > 0.05 & abs(my_data['Students t-test difference (Ctx vs LonA)']) > 1.5 ),"group"] <- "FoldChange"

# change the grouping for the entries with both significance and large enough fold change
my_data[which(my_data['- log (p-value)'] < 0.05 & abs(my_data['Students t-test difference (Ctx vs LonA)']) > 1.5 ),"group"] <- "Significant&FoldChange"

# Preview dataset
my_data
