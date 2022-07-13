#Files:

station.csv; Contains data that represents a station where users can pick up or return bikes.

trips.csv; Data about individual bike trips.

weather.csv; Data about the weather on a specific day for certain zip codes/cities.

# Branches:

## trip-EDA (Archana)
-Conduct an EDA on Trip data
-**main files:** trip-eda.R 
  -Run to produce plots and get exploratory data analysis on weather dataset
  
## weather-EDA (Imran)
-Conduct an EDA on Weather data
-**main files:** weather-eda.R 
  -Run to produce plots and get exploratory data analysis on weather dataset
  -Generates weather-processed.R that has adjustments to variables to better fit the data

## cancelled_trips (Archana)
-Remove any trips under 2 minutes
-**main files:** cancelled_trips.R
  -Produces an RDS that is used in future files
  
## outliers (Archana)
-Remove outliers from trip and weather datasets according the the 1.5IQR rule
-**main files:** Outliers.R
  -Produces trip_no_outliers.rds and weather_no_outliers.rds that are used in future files
  
## rush-hour (Imran)
-Determines the highest volume rush hours on weekdays
-Determines the 10 busiest starting and ending stations during rush hours
-Determines the 10 busiest stasrtin and ending stations during weekends
-**main files:** rush_hours.R
  -Produces plots and determines rush hours necessary for the data science team

## avg_utilization (Archana)
-Calculate the average utilization of bikes for each month 
-**main files:** avg_utilization.r

## weather-conditions (Imran)
-**main files:** trip_weather_joined.r
  -Joins trip to station by station ID to apply city lcoations
  -Joins weather to trip+station joined by date and city to apply weather conditions for each trip
  -Finds correlation between trip duration and different weather metrics
