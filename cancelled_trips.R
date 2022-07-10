# Cancelled Trips 

library("dplyr")

# Any trip with duration less than 2 minutes is likely a 'cancelled trip'. 
# Find out the number of such trips, record the information for your report and 
# then remove them from the dataset

trip_data <- read.csv("trip.csv", header = T, sep = ",")

# find the trips with duration less than 2 minutes
trip_data_cancelled <- filter(trip_data, trip_data$duration < 120)

# remove cancelled trips from data set 
trip_data2 <- trip_data %>%
  filter(trip_data$duration >= 120)

