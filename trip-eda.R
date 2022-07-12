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

# setup basic_eda function 

trip_eda <- function(trip_data)
{
  glimpse(trip_data) 
  # 326,339 obs
  # 11 variables
          
  print(status(trip_data))
  # 50 0s in zip_code
  # variables to turn into factors: start_station_name, end_station_name, 
  # variables of interest: duration, start_date, start_station_name, end_date, end_station_name, 
  
  freq(trip_data)
  # ~85% subscriber
  # ~15% customer
  
  # export plots
  freq(trip_data, path_out = ".")
  
  
  print(profiling_num(trip_data))
  # right skew: duration (also high variation ceof, and std dev)
  
  plot_num(trip_data)
  # duration: one large peak
  # start_station_id: left skewed 
  # end_station_id: left skewed 
  # bike_id: unimodal, may have outliers
  
  #export plots
  plot_num(trip_data, path_out = ".")
  
  describe(trip_data)
  # 1493 missing zip_code
}

# run the above function for trip_data
trip_eda(trip_data)
