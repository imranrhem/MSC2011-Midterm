# DETERMING WHAT CORRELATIONS OF WEATHER
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
ts_joined <- inner_join(station,trip, by = c("id" = "start_station_id"))

# Join weather to ts_joined by date and city (ensures there are only weather reports for the same day and location)                      
wt_joined <- inner_join(ts_joined, weather, by = c("start_date" = "date", "city" = "city"))
table(wt_joined$events)
table(wt_joined$city)

# Determine the number of trips for each event (skewed as there are naturally more events)
wt_events <- wt_joined %>%
  group_by(city) %>%
  summarise(events = table(events))
  # Should not use weather events as there are naturally more days with no events, and cities follow the same ratio
  
# Create a new data set only containing the numerical weather measurements
wt_numerical <- dplyr::select(weather,c(max_temperature_f:cloud_cover))

# Create correlation plot
wt_corr <- cor(wt_numerical, use = "complete.obs")

# Rename columns and rows for plot
colnames(wt_corr) <- c("Max Temperature (F)", "Mean Temperature (F)", "Min Temperature (F)"
                  , "Max Visibility (miles)", "Mean Visibility (miles)", "Min Visibility (miles)",
                  "Max Wind Speed (mph)", "Mean Wind Speed (mph)", "Max Gust Speed (mph)",
                  "Precipitation (inches)", "Cloud Cover")
rownames(wt_corr) <- c("Max Temperature (F)", "Mean Temperature (F)", "Min Temperature (F)"
                       , "Max Visibility (miles)", "Mean Visibility (miles)", "Min Visibility (miles)",
                       "Max Wind Speed (mph)", "Mean Wind Speed (mph)", "Max Gust Speed (mph)",
                       "Precipitation (inches)", "Cloud Cover")
# Create corrplot
corrplot(wt_corr, method = "circle", 
         order = "original", 
         tl.col = "black", 
         col = COL2("RdBu", 10),
         tl.cex = 0.8,
         tl.srt = 45,
         cl.cex = 0.8,
         cl.offset = 1.4)

