-- Now we can start the analysis process.

-- Lets get the riders, and total rides taken.

SELECT member_casual, COUNT(*) AS total_trips
FROM `2023_Data.final_merged_clean_2023`
GROUP BY member_casual;

-- Get the type they ride, electric, basic, or docked.
SELECT  member_casual, rideable_type, COUNT(*) AS total_trips
FROM `2023_Data.final_merged_clean_2023`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips;

-- Get the rides by month per type of member
SELECT month, member_casual, COUNT(ride_id) as total_trips , AVG(ride_length) AS avg_length
FROM `2023_Data.final_merged_clean_2023`
GROUP BY month, member_casual
ORDER BY month;

-- Get rides per week per type of member
SELECT day_of_week, member_casual, COUNT(ride_id) as total_trips, AVG(ride_length) AS avg_length
FROM `2023_Data.final_merged_clean_2023`
GROUP BY day_of_week, member_casual;

-- Get rides per hour
SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day,member_casual, COUNT(ride_id) AS total_trips, AVG(ride_length) AS avg_length
FROM `2023_Data.final_merged_clean_2023`
GROUP BY hour_of_day, member_casual;
