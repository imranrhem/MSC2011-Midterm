# DETERMINE THE HIGHEST VOLUME HOURS ON WEEKDAYS

library("dplyr")
library("lubridate")

# Load the trip data with no outliers
trips <- trip_no_outliers

# Convert the starting time to date format
trips <- trips %>% mutate(start_date = mdy_hm(start_date))

# Identify which day each trip started on
trips$weekday = weekdays(trips$start_date)

par(mfrow = c(5,1))

# Determine rush hours for Mondays
monday_trips <- trips[trips$weekday == "Monday",]
class(monday_trips$start_date)
monday_trips$hour = as.numeric(format(monday_trips$start_date, "%H"))
hist(monday_trips$hour)

# Determine rush hours for Tuesdays
tuesday_trips <- trips[trips$weekday == "Tuesday",]
class(tuesday_trips$start_date)
tuesday_trips$hour = as.numeric(format(tuesday_trips$start_date, "%H"))
hist(tuesday_trips$hour)

# Determine rush hours for Wednesdays
wednesday_trips <- trips[trips$weekday == "Wednesday",]
class(wednesday_trips$start_date)
wednesday_trips$hour = as.numeric(format(wednesday_trips$start_date, "%H"))
hist(wednesday_trips$hour)

# Determine rush hours for Thursdays
thursday_trips <- trips[trips$weekday == "Thursday",]
class(thursday_trips$start_date)
thursday_trips$hour = as.numeric(format(thursday_trips$start_date, "%H"))
hist(thursday_trips$hour)

# Determine rush hours for Friday
Friday_trips <- trips[trips$weekday == "Friday",]
class(Friday_trips$start_date)
Friday_trips$hour = as.numeric(format(Friday_trips$start_date, "%H"))
hist(Friday_trips$hour)




