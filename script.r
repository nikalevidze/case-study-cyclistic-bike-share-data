# Tidyverse R Programming Script

# Install and load necessary packages
install.packages("tidyverse")
library(tidyverse)
install.packages("readr")

# Importing data for March 2022
X202203 <- X202203_divvy_tripdata <- read_csv("202203-divvy-tripdata.csv")

# Calculate ride length
X202203_with_ride_length <- mutate(X202203_divvy_tripdata, ride_length = ended_at - started_at)

# Calculate day of the week
X202203_with_ride_length_and_wday <- mutate(X202203_with_ride_length, day_of_week = wday(started_at))

# Calculate hour of the day
X202203_with_ride_length_and_wday_and_hour <- mutate(X202203_with_ride_length_and_wday, hour_of_day = hour(started_at))

# Analysis: Weekend Usage
ggplot(data = X202203_with_ride_length_and_wday) +
  geom_bar(mapping = aes(x = day_of_week)) +
  facet_wrap(~member_casual)

# Analysis: Time of the day usage
ggplot(data = X202203_with_ride_length_and_wday_and_hour) +
  geom_bar(mapping = aes(x = hour_of_day)) +
  facet_wrap(~member_casual)

# Analysis: Proximity to Business Centers (Visualization done in Tableau)

# Calculate ride length in minutes
X202203_with_ride_length_minutes_and_wday_and_hour <- mutate(X202203_with_ride_length_and_wday_and_hour, ride_length_minutes = ride_length / 60)

# Visualization: Average monthly mileage
ggplot(data = X202203_with_ride_length_minutes_and_wday_and_hour) +
  geom_bar(mapping = aes(y = mean(ride_length_minutes))) +
  facet_wrap(~member_casual)

# Check average ride length for Casual Riders
print(mean(subset(X202203_with_ride_length_minutes_and_wday_and_hour, member_casual == "casual")$ride_length_minutes))

# Check average ride length for Annual members
print(mean(subset(X202203_with_ride_length_minutes_and_wday_and_hour, member_casual == "member")$ride_length_minutes))
