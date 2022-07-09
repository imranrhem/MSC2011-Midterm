# TRIP - EXPLORATORY DATA ANALYSIS 

# install packages
install.packages("tidyverse")
install.packages("funModeling")
install.packages("Hmisc")

# load packages
library(funModeling) 
library(tidyverse) 
library(Hmisc)

# import the trip dataset as a datafram 
trip_data <- read.csv("trip.csv")

# setup basic_eda
