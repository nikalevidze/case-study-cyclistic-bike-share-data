# Tidyverse R Programming Analysis

## Introduction
This README provides a summary of the R programming script using Tidyverse packages for data wrangling and analysis.

## Setup
### Make sure to install the necessary packages before running the script:
```r
install.packages("tidyverse")
library(tidyverse)
install.packages("readr")
```

## Data Import
### We imported ride data for March 2022 from a CSV file. The file can be found on this [Kaggle dataset](https://www.kaggle.com/datasets/evangower/cyclistic-bike-share?resource=download), the name of the file is 202203-divvy-tripdata and it's too large to upload it to GitHub directly.

```r
X202203 <- X202203_divvy_tripdata <- read_csv("202203-divvy-tripdata.csv")
```

## Calculated Columns
### Two new metrics were created based on the available data:

### Ride Length: Difference between start time and end time of rides.

```r
X202203_with_ride_length <- mutate(X202203_divvy_tripdata, ride_length = ended_at - started_at)
```

### Day of the Week: Calculated using the wday function based on the start time of the ride.

```r
X202203_with_ride_length_and_wday <- mutate(X202203_with_ride_length, day_of_week = wday(started_at))
```
### Hour of the Day: Calculated using the hour function based on the start time of the ride.

```r
X202203_with_ride_length_and_wday_and_hour <- mutate(X202203_with_ride_length_and_wday, hour_of_day = hour(started_at))
```


## Analysis
## Weekend Usage
### Analysis of distribution of rides throughout the days of the week, categorized by member type.

```r
ggplot(data = X202203_with_ride_length_and_wday) +
  geom_bar(mapping = aes(x = day_of_week)) +
  facet_wrap(~member_casual)
```

## Time of the Day Usage
### Analysis of distribution of rides throughout the day, categorized by member type.

```r
ggplot(data = X202203_with_ride_length_and_wday_and_hour) +
  geom_bar(mapping = aes(x = hour_of_day)) +
  facet_wrap(~member_casual)
```

## Proximity to Business Centers
### Visualization done in  [Tableau](https://website-name.com](https://public.tableau.com/app/profile/nika.levidze/viz/CitibikeHeatmap/Dashboard1))


## Average Monthly Mileage
### Comparison of average ride length between user types.

```r
ggplot(data = X202203_with_ride_length_minutes_and_wday_and_hour) +
  geom_bar(mapping = aes(y = mean(ride_length_minutes))) +
  facet_wrap(~member_casual)
```

## Conclusion
### The analysis provides insights into user behavior based on ride data, including usage patterns throughout the week, time of day usage, and average ride length. These insights can inform marketing strategies and business decisions.

