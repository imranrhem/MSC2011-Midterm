# DETERMINE THE HIGHEST VOLUME HOURS ON WEEKDAYS

library("dplyr")
library("lubridate")

# Load the trip data with no outliers
trips <- readRDS("trip_no_outliers.rds")

# Convert the starting time to date format
trips <- trips %>% mutate(start_date = mdy_hm(start_date))

# Identify which day each trip started on
trips$weekday = weekdays(trips$start_date)

# Determine if there are any duplicate entries in the 
table(trips$start_station_name)
  # Post at Kearney and Post at Kearny (have same ID)
  # Washington at Kearney and Washington at Kearney (have same ID)

#### Determine rush hours through all weekdays

monday_trips <- trips[trips$weekday == "Monday",]
class(monday_trips$start_date)
monday_trips$hour = as.numeric(format(monday_trips$start_date, "%H"))
hist(monday_trips$hour)

# Determine rush hours for Tuesdays
tuesday_trips <- trips[trips$weekday == "Tuesday",]
class(tuesday_trips$start_date)
tuesday_trips$hour = as.numeric(format(tuesday_trips$start_date, "%H"))
hist(tuesday_trips$hour)
# Create new column that takes the "hour" the trip begin at
weekday_trips$hour = as.numeric(format(weekday_trips$start_date, "%H"))

# Determine rush hours for Wednesdays
wednesday_trips <- trips[trips$weekday == "Wednesday",]
class(wednesday_trips$start_date)
wednesday_trips$hour = as.numeric(format(wednesday_trips$start_date, "%H"))
hist(wednesday_trips$hour)
# Plot hours on a histogram for visualization
hist(weekday_trips$hour, main = "Numer of Trips Throughout Weekdays", xlab = "Time in Hours")
# Rush hours are 8:00 (8am)
# And 17:00 5(pm)

# Determine rush hours for Thursdays
thursday_trips <- trips[trips$weekday == "Thursday",]
class(thursday_trips$start_date)
thursday_trips$hour = as.numeric(format(thursday_trips$start_date, "%H"))
hist(thursday_trips$hour)
#### Determine the busiest 10 starting and ending stations during rush hours on weekdays

# Determine rush hours for Friday
Friday_trips <- trips[trips$weekday == "Friday",]
class(Friday_trips$start_date)
Friday_trips$hour = as.numeric(format(Friday_trips$start_date, "%H"))
hist(Friday_trips$hour)

# Build new dataframe with only weekdays
weekday_trips <- trips[trips$weekday == "Monday" | trips$weekday == "Tuesday" | 
                       trips$weekday == "Wednesday" | trips$weekday == "Thursday" |
                       trips$weekday == "Friday", ]

# Create new column that takes the "hour" the trip begin at
weekday_trips$hour = as.numeric(format(weekday_trips$start_date, "%H"))

# Plot hours on a histogram for visualization
hist(weekday_trips$hour, main = "Numer of Trips Throughout Weekdays", xlab = "Time in Hours")
  # Rush hours are 8:00 (8am)
  # And 17:00 5(pm)

#### Determine the busiest 10 starting and ending stations during rush hours on weekdays

# Create new dataframe with only the trips during the morning rush hour
morning_rush <- weekday_trips[weekday_trips$hour == 8,]

# Create a table containing the 10 busiest starting station in order
morning_starting <- table(morning_rush$start_station_id)
morning_starting <- sort(morning_starting, decreasing = T, na.rm = T)[1:10]

# Plot the 10 busiest starting station in the morning rush hour
barplot(morning_starting, 
        main = "Ten Busiest Starting Stations During Morning Rush Hour",
        ylab = "Number of Trips",
        cex.lab = 1.3,
        cex.axis = 1,
        cex.names = 0.6,
        ylim = c(0,6500),
        las = 2)

# Create a table containing the 10 busiest ending station in order
morning_ending <- table(morning_rush$end_station_id)
morning_ending <- sort(morning_ending, decreasing = T, na.rm = T)[1:10]

# Plot the 10 busiest ending stations in the morning rush hour
barplot(morning_ending, 
        main = "Ten Busiest Ending Stations During Morning Rush Hour",
        ylab = "Number of Trips",
        cex.lab = 1.3,
        cex.axis = 1.2,
        cex.names = 1.2,
        ylim = c(0,3500),
        las = 2)

# Create a new dataframe with only the trips during the evening rush hour
evening_rush <- weekday_trips[weekday_trips$hour == 17,]

# Create a table containing the 10 busiest starting station in order
evening_starting <- table(evening_rush$start_station_id)
evening_starting <- sort(evening_starting, decreasing = T, na.rm = T)[1:10]

# Plot the 10 busiest starting station in the evening rush hour
barplot(evening_starting, 
        main = "Ten Busiest Starting Stations During Evening Rush Hour",
        ylab = "Number of Trips",
        cex.lab = 1.3,
        cex.axis = 1.2,
        cex.names = 1.2,
        ylim = c(0,2000),
        las = 2)

# Create a table containing the 10 busiest ending station in order
evening_ending <- table(evening_rush$end_station_id)
evening_ending <- sort(evening_ending, decreasing = T, na.rm = T)[1:10]

# Plot the 10 busiest ending stations in the evening rush hour
barplot(evening_ending, 
        main = "Ten Busiest Ending Stations During Evening Rush Hour",
        ylab = "Number of Trips",
        cex.lab = 1.3,
        cex.axis = 1.2,
        cex.names = 1.2,
        ylim = c(0,7000),
        las = 2)

##### Determine the busiest 10 stations during weekends

# Build new dataframe with only weekends
weekend_trips <- trips[trips$weekday == "Saturday" | trips$weekday == "Sunday",]

# Make a table including the 10 most frequent starting stations on weekends
weekend_starting <- table(weekend_trips$start_station_id)
weekend_starting <- sort(weekend_starting, decreasing = T, na.rm = T)[1:10]

# Plot the 10 busiest starting stations during the weekend
barplot(weekend_starting, 
        main = "Ten Busiest Starting Stations During Weekends",
        ylab = "Number of Trips",
        cex.lab = 1.3,
        cex.axis = 1.2,
        cex.names = 1.2,
        ylim = c(0,2500),
        las = 2)

# Make a table including the 10 most frequent ending stations on weekends
weekend_ending <- table(weekend_trips$end_station_id)
weekend_ending <- sort(weekend_ending, decreasing = T, na.rm = T)[1:10]

# Plot the 10 busiest ending stations during the weekend
barplot(weekend_ending, 
        main = "Ten Busiest Ending Stations During Weekends",
        ylab = "Number of Trips",
        cex.lab = 1.3,
        cex.axis = 1.2,
        cex.names = 1.2,
        ylim = c(0,2500),
        las = 2)

