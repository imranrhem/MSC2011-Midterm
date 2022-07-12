# Outliers 

# Identify the outliers in the dataset (you have to decide which table/column), 
# record them for your final report and then remove from the dataset

################################################################################## 
# trip data outliers 

trip_data2 <- readRDS("trips_2minutes.RDS")

# create a dataframe to store trip data outliers
trip_outliers <- data.frame()

# create a box plot for the trip data for numeric variables
# box plot for duration
boxplot(trip_data2$duration) # outliers present
# find the outliers in duration
duration_outliers <- boxplot.stats(trip_data2$duration)$out
# find row numbers for duration outliers
duration_outliers_rownum <- which(trip_data2$duration %in% c(duration_outliers))
duration_outrows <- trip_data2[duration_outliers_rownum,]
# add the outliers to the trip outliers_dataset
trip_outliers<- rbind(trip_outliers, duration_outrows)
# remove outliers from trip_data2 and store in new dataset
trip_data3 <- trip_data2[-duration_outliers_rownum,]

saveRDS(trip_data3, "trip_no_outliers.rds")

################################################################################## 
# weather data outliers 

weather_data <- readRDS("weather_processed.rds")

# create a dataframe from store weather data outliers 
weather_outliers <- data.frame()
weather_data2 <- weather_data

# go through every coloumn and print it out
# for(i in 2:10) {
#   print(names(weather_data)[i])
#   # create a box plot for the weather data for numeric variables
#   boxplot(weather_data[ , i])
#   column_outliers <- boxplot.stats(weather_data2[,i])$out
#   print(column_outliers)
#   # find row numbers for mean_temperature_f outliers
#   column_outliers_rownum <- which(weather_data2[,i] %in% c(column_outliers))
#   print(column_outliers_rownum)
#   column_outrows <- weather_data2[column_outliers_rownum,]
#   # add the outliers to the weather_outliers dataset if not already present
#   weather_outliers<- rbind(weather_outliers, column_outrows)
#   # remove outliers from weather_data and store in new dataset
#   weather_data2 <- weather_data2[-column_outliers_rownum,]
# }

# create a box plot for the weather data for numeric variables
# box plot for mean_temperature_f
boxplot(weather_data$mean_temperature_f) # no outliers present

# box plot for min_temperature_f
boxplot(weather_data$min_temperature_f) # outliers present
# find the outliers in min_temperature_f
mintemp_outliers <- boxplot.stats(weather_data$min_temperature_f)$out
print(mintemp_outliers)
# find row numbers for min_temperature_f outliers
mintemp_outliers_rownum <- which(weather_data$min_temperature_f %in% c(mintemp_outliers))
mintemp_outrows <- weather_data[mintemp_outliers_rownum,]
# add the outliers to the weather_outliers dataset
weather_outliers<- rbind(weather_outliers, mintemp_outrows)
# remove outliers from weather_data and store in new dataset
weather_data <- weather_data[-mintemp_outliers_rownum,]

# box plot for max_temperature_f
boxplot(weather_data$max_temperature_f) # outliers present
# find the outliers in max_termperature_f
maxtemp_outliers <- boxplot.stats(weather_data$max_temperature_f)$out
# find row numbers for max_termperature_f outliers
maxtemp_outliers_rownum <- which(weather_data$max_temperature_f %in% c(maxtemp_outliers))
maxtemp_outrows <- weather_data[maxtemp_outliers_rownum,]
# add the outliers to the weather_outliers dataset
weather_outliers<- rbind(weather_outliers, maxtemp_outrows)
# remove outliers from weather_data and store in new dataset
weather_data <- weather_data[-maxtemp_outliers_rownum,]

# box plot for mean_visibility_miles
boxplot(weather_data$mean_visibility_miles) # outliers present, but IQR is 0, ignore

# box plot for min_visibility_miles
boxplot(weather_data$min_visibility_miles) # outliers present, but distribution is one sided, ignore

# box plot for max_visibility_miles
boxplot(weather_data$max_visibility_miles) # outliers present, but IQR is 0, ignore

# box plot for mean_wind_speed_mph
boxplot(weather_data$mean_wind_speed_mph) # outliers present
# find the outliers in mean_wind_speed_mph
mean_wind_outliers <- boxplot.stats(weather_data$mean_wind_speed_mph)$out
# find row numbers for mean_wind_speed_mph outliers
mean_wind_outliers_rownum <- which(weather_data$mean_wind_speed_mph %in% c(mean_wind_outliers))
mean_wind_outrows <- weather_data[mean_wind_outliers_rownum,]
# add the outliers to the weather_outliers dataset
weather_outliers<- rbind(weather_outliers, mean_wind_outrows)
# remove outliers from weather_data and store rows without outliers in new dataframe
weather_data <- weather_data[-mean_wind_outliers_rownum,]

# box plot for max_wind_speed_mph
boxplot(weather_data$max_wind_Speed_mph) # outliers present
# find the outliers in max_wind_speed_mph
max_wind_outliers <- boxplot.stats(weather_data$max_wind_Speed_mph)$out
# find row numbers for max_wind_speed_mph outliers
max_wind_outliers_rownum <- which(weather_data$max_wind_Speed_mph %in% c(max_wind_outliers))
max_wind_outrows <- weather_data[max_wind_outliers_rownum,]
# add the outliers to the weather_outliers dataset
weather_outliers<- rbind(weather_outliers, max_wind_outrows)
# remove outliers from weather_data and store rows without outliers in new dataframe
weather_data <- weather_data[-max_wind_outliers_rownum,]

# box plot for max_gust_speed_mph
boxplot(weather_data$max_gust_speed_mph) # outliers present
# find the outliers in max_gust_speed_mph
max_gust_outliers <- boxplot.stats(weather_data$max_gust_speed_mph)$out
# find row numbers for max_gust_speed_mph outliers
max_gust_outliers_rownum <- which(weather_data$max_gust_speed_mph %in% c(max_gust_outliers))
max_gust_outrows <- weather_data[max_gust_outliers_rownum,]
# add the outliers to the weather_outliers dataset
weather_outliers<- rbind(weather_outliers, max_gust_outrows)
# remove outliers from weather_data and store rows without outliers in new dataframe
weather_data <- weather_data[-max_gust_outliers_rownum,]

# box plot for precipitation_inches
boxplot(weather_data$precipitation_inches) # heavily skewed
#Apply log transformation
log_precip <- log(weather_data$precipitation_inches)
hist(log_precip)

saveRDS(weather_data, "weather_no_outliers.rds")

