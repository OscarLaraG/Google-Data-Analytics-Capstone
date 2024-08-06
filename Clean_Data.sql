-- Data Cleaning

DROP TABLE IF EXISTS `2023_Data.merged_clean_2023`;
DROP TABLE IF EXISTS `2023_Data.ride_lengths`;

-- We will use multiple queries to be able to clean the data.

-- Let's start by calculating ride length, how long do members / casuals ride?
-- Important to note: started_at = '2023-08-01 10:15:30', is the format of the date.
-- We extract the hour first , then minute , then seconds.

CREATE OR REPLACE TABLE `2023_Data.ride_lengths` AS 
SELECT 
  ride_id,
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 + 
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60 AS ride_length
FROM `2023_Data.2023_merged`;


-- Let us start to clean some data
-- We want to merge the ride length data to the merged data
-- We also want only rides longer than a minute, but less than a day. That means they kept the bike for longer,
-- While we do this, we also only want rows that ARE NOT null, this removes any rows that have null values within them,
CREATE OR REPLACE TABLE `2023_Data.cleaned_merged_data` AS 
SELECT
  a.ride_id,
  a.rideable_type, 
  a.started_at, 
  a.ended_at, 
  b.ride_length,
  a.start_station_name, 
  a.end_station_name, 
  a.start_lat, 
  a.start_lng, 
  a.end_lat, 
  a.end_lng, 
  a.member_casual
FROM `2023_Data.2023_merged` a
JOIN `2023_Data.ride_lengths` b
on a.ride_id = b.ride_id
WHERE 
    a.start_station_name IS NOT NULL AND
    a.end_station_name IS NOT NULL AND
    a.end_lat IS NOT NULL AND
    a.end_lng IS NOT NULL AND
    b.ride_length > 1 AND 
    b.ride_length < 1440 AND
    a.started_at BETWEEN TIMESTAMP('2023-01-01 00:00:00') AND TIMESTAMP('2023-12-31 23:59:59');

-- Now, we can combine and see the cleaned data.
-- We will, create day of week and month, we filter from the very first day to the last day of the 12 month period.
CREATE OR REPLACE TABLE `2023_Data.final_merged_clean_2023` AS 
SELECT
    ride_id, 
    rideable_type, 
    started_at, 
    ended_at, 
    ride_length,
    CASE EXTRACT(DAYOFWEEK FROM started_at) 
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'    
    END AS day_of_week,
    ARRAY['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'][ORDINAL(EXTRACT(MONTH FROM started_at))] AS month,
    start_station_name, 
    end_station_name, 
    start_lat, 
    start_lng, 
    end_lat, 
    end_lng, 
    member_casual
FROM `2023_Data.cleaned_merged_data`
ORDER BY started_at;

