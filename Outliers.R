# Outliers 

# Identify the outliers in the dataset (you have to decide which table/column), 
# record them for your final report and then remove from the dataset

################################################################################## 
# trip data outliers 

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
# remove outliers from trip_data2
trip_data3 <- trip_data2[-duration_outliers_rownum,]


#duration_outliers <- trip_data2$duration[!trip_data2$duration %in% boxplot.stats
                                         (trip_data2$duration)$out]
#length(trip_data2$duration) - length(duration_outliers)
