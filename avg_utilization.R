# Average Utilization 

trip_data2 <- readRDS("trip_no_outliers.rds")
library("dplyr")

# Calculate the average utilization of bikes for each month (total time used/total time in month)

# convert start date into date type 
trip_data2$start_date <- as.POSIXct(trip_data2$start_date, format="%m/%d/%Y")

# create a column for month in the data frame base on the start date
trip_data2$Month<-months(trip_data2$start_date)

# group the duration by months 
avg_utilization <- trip_data2 %>% 
  group_by(Month) %>%
  summarise_at(vars(duration), list(TotalDuration = sum)) %>%
  # create a row for the average per month 
  mutate(AverageUtilization = 0)

# Assign values for AverageUtilization depending on the month
# 2678000 seconds in a 31 day month
avg_utilization$AverageUtilization <- ifelse(avg_utilization$Month == "January"|avg_utilization$Month == "March" | 
                                          avg_utilization$Month == "May" | avg_utilization$Month == "July" | 
                                          avg_utilization$Month == "August"| avg_utilization$Month == "October" |
                                          avg_utilization$Month == "December", avg_utilization$TotalDuration/2678000,
                                          # February has 2419200 seconds in a 28-day month
                                  ifelse(avg_utilization$Month == "February", avg_utilization$TotalDuration/2419200,
                                         # all other months have 2592000 seconds 
                                         avg_utilization$TotalDuration/2592000))

