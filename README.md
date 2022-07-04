Files:
**station.csv**; Contains data that represents a station where users can pick up or return bikes.
**trips.csv**; Data about individual bike trips
**weather.csv**; Data about the weather on a specific day for certain zip codes/cities.

Tasks:

• Conduct and EDA on Trip and Weather Data; follow setps in EDA blog post

•	Any trip with duration less than 2 minutes is likely a 'cancelled trip'. Find out the number of such trips, record the information for your report and then remove them from the dataset.

•	Identify the outliers in the dataset (you have to decide which table/column), record them for your final report and then remove from the dataset.

•	The data science team needs you to establish the highest volume hours on weekdays, so that they can build 'rush hours' into their model (lubridate package is your BFF here). You can choose what approach to take, but you have to find the hours of weekdays where the trip volume is highest. (e.g. you may try histograms)

•	Determine the 10 most frequent starting stations and ending stations during the rush hours you established.

•	Determine the 10 most frequent starting stations and ending stations during the weekends.

•	Calculate the average utilization of bikes for each month (total time used/total time in month).

•	The team assumes that weather conditions probably have an impact on the bike rental patterns, but they are not sure whether they should use temperature, weather events, visibility or other weather measurements available. Help them decide by creating a new dataset combining trip data with the weather data. (Note that the weather data is available for each city and date. Join your datasets accordingly). Create a correlation matrix for the new dataset using the cor() function from the corrplot package. Flag the highest correlations for the data science team.
