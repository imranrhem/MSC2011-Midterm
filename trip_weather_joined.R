# DETERMING WHAT WEATHER IMPACTS AFFECT TRIP FREQUENCY THE MOST

library(dplyr)
library(lubridate)
library(corrplot)
#### Import weather data
weather <- readRDS("weather_no_outliers.rds")

# Replace T values in precipitation_inches with 0 and convert to numeric
weather$precipitation_inches <- stringr::str_replace(weather$precipitation_inches, "T", "0")
weather <- weather %>% mutate(precipitation_inches = as.numeric(precipitation_inches))

# Replace empty values with "No Event" in events
weather$events[weather$events == ""] <- "No Event"
weather$events[weather$events == "rain"] <- "Rain"

# Convert zip_code to character 
weather$zip_code <- as.character(weather$zip_code)

# Convert date to POSIX format
weather <- weather %>% mutate(date = mdy(date))

summary(weather)

#### Import trip data
trip <- readRDS("trip_no_outliers.rds")

# Convert starting date to POSIX format with only dates
trip <- trip %>% mutate(start_date = as.Date(mdy_hm(start_date)))

station <- read.csv("station.csv")

#### Join weather and join tables

# Join station to trips using name and start station to get cities
ts_joined <- inner_join(station,trip, by = c("name" = "start_station_name"))

# Join weather to ts_joined by date and city (ensures there are only weather reports for the same day and location)                      
wt_joined <- inner_join(ts_joined, weather, by = c("start_date" = "date", "city" = "city"))
table(wt_joined$events)

# Determine the number of trips for each event (skewed as there are naturally more events)
wt_events <- wt_joined %>%
  group_by(events) %>%
  summarize(Trips = n())

# Create a new data set only containing the numerical weather measurements
wt_numerical <- dplyr::select(wt_joined,c(max_temperature_f:cloud_cover))

# Create correlation plot
wt_corr <- cor(wt_numerical, use = "complete.obs")
corrplot(wt_corr, method = "number", order = "AOE")

