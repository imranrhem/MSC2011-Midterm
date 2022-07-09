# WEATHER - EXPLORATORY DATA ANALYSIS

library(funModeling)
library(tidyverse)
library(Hmisc)
library(stringr)
library(dplyr)

# Import weather dataset as a dataframe
weather_data <- read.csv("weather.csv", header = TRUE, sep = ",")

# Head the first observations and view the total number of observations and variables
glimpse(weather_data)
  # 1825 total observations
  # 15 variables
  # Data is in imperial measurements (F, miles, mph, inches)

# Replace T values in precipitation_inches with 0 and convert to numeric
weather_data$precipitation_inches <- stringr::str_replace(weather_data$precipitation_inches, "T", "0")
weather_data <- weather_data %>% mutate(precipitation_inches = as.numeric(precipitation_inches))


# Replace empty values with "No Event" in events
weather_data$events[weather_data$events == ""] <- "No Event"

# Convert zip_code to character 
weather_data$zip_code <- as.character(weather_data$zip_code)

# Gain metrics on data types, zeroes, infinite numbers, and missing values
print(status(weather_data))
  # 451 missing values in max_gust_speed_mph
  # 1543 0s in precipitation_inches (no precipitation on that day), will skew histograms heavily
  # Variables to turn into factors: cloud_cover, events, city
  # Variables of interest: precipitation_inches (contains T and integer values)
  # zip_code has as many unique values as city (zipcode is not unique)

# Analyze categorical variables
freq(weather_data) 
  # Equal distribution entires for all 5 cities
  # 1473 NULL values in events variable
  # precipitation_inches is treated as a categorical variable due to T 

  #Export frequency plots to current directory
  freq(weather_data, path_out = ".")
     
print(profiling_num(weather_data))
  # Right skew: max_wind_speed_mph, max_gust_speed_mph (also have high st dev)
  # wind speed descriptor variables have high variation_ceof

plot_num(weather_data)
  # max_temp_f -> unimodal with potentially some outliers
  # mean_temp_f -> unimodal
  # min_temp_f -> unimodal
  # max_visibility_miles -> one large peak, will have high std dev
  # mean_visibility miles -> one large peak, but balanced on either side
  # min_visibility_miles -> left skew, outliers present 15+
  # max_wind_speed_mph -> outliers present, towards 120
  # mean_wind_speed -> slight right skew, potential outliers towards 20
  # max_gust_speed_mph -> right skew, definitely has outliers towards 90
  # cloud_cover -> should be treated as factor, but well distributed
  # zip_code -> being treated as numerical, should convert to a factor
  #Export numerical plots to current directory
  plot_num(weather_data, path_out = ".")

describe(weather_data)
  # Consistent observations with above
