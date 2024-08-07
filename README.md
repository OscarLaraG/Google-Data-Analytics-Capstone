# Google Data Analytics Capstone: Cyclistic Case Study
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
## Introduction
In this case study I will take the role of a junior Data Analyst for a company called Cyclistic. Based in Chicago, the company rents bikes to people for an affordable price, for both casual and annual members.

I am tasked at analyszing the data set given to me over the course of 12 months in 2023. The data set can be found here: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)
### Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). For this project, I used 2023 data, however you can choose to explore other years.
   
Data Visualizations: Can be found as images within the repository in their own folder. 
### Scenario
I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.
## Ask
### Business Task
Come up with marketing strategies with the data provided to convert casual members to paid subscription members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?
## Prepare
### Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2023 to Dec 2023 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).  
  
This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
### Data Organization
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as: start station (Where did they get the bike),Rideale type (What type of bike is it), member id, membership type, etc.

## Process
BigQuery is used to combine the various datasets into one dataset, we will explore, clean, and analyze the data using SQL Queries. This can be done in spreadsheets such as Google Sheets, or python / R programming language. However, with larger data files I found it more convenient to upload the files into Google Cloud Storage. This is also convenient, as Big Query can directly access your files in drive or GCS.
### Combining the Data
We are given 12 CSV files, one for each month of 2023. To facilitate the process of working with such large data, we use BigQuery to perform SQL Queries, in doing so we merge all 12 CSV files into one.
The file can be found here: 

### Data Cleaning
Upon merging, and getting and overview of the data, it is time to clean it to make it as accurate and reliable as possible.

To clean it:
- Remove null values
- Remove rides that are longer than a day (Bike wasnt returned, was not being used), but also less than a minute.
- Using the date provided, we can create a column for:
   - Month, Day of week and hour.
   - Ride length AVG, will give us a bit more insight.
 
## Data Analysis and Summarizing the Data
We can begin by checking the total trips per member.

![image](https://github.com/OscarLaraG/Google-Data-Analytics-Capstone/blob/main/pictures/trips_by_member.png)
  
We can see that Annual members nearly double the amount of trips compared to the casual members. This is important to keep in mind, as Cyclistic generates the most money from their subcription package.
  
Next, we can see the type of bikes the members use and how many trips were taken in total on those bikes.  
  
![image](https://github.com/OscarLaraG/Google-Data-Analytics-Capstone/blob/main/pictures/rideable_type_by_member.png)

We can begin to build better insights by anaylzing: 
- Months
- Days of the week
- Rides per hour.


![image](https://github.com/OscarLaraG/Google-Data-Analytics-Capstone/blob/main/pictures/rides_per_month_avg.png)

__Months:__ When it comes to riders per month and their average we find that Annual members take almost double the amount of trips per month that casual riders do. However, Casual riders take much longer ride lengths compared to Annual members. We also see that during the months of April - September there is a spike in both Casual and Annual members. During these months, Annual members stay consistent in their average ride lengths, while casual members see their ride lengths double during those months where the weather is warmer (Spring).

![image](https://github.com/OscarLaraG/Google-Data-Analytics-Capstone/blob/main/pictures/rides_per_day_avg.png)
__Days of Week:__ In relation to days of the week, Casual members ride more than Annual members from Friday - Sunday. At this time, their ride length also increases. In comparison, Annual members see their trips drop during the weekends, however their avg ride length throughout the week is always consistent. Casual members average ride length drops during the weekdays (Monday - Thursday), along with the total number of trips. While there is a spike for Annual members during that period, reaching a high of almost 475K trips from Monday - Thursday!

![image](https://github.com/OscarLaraG/Google-Data-Analytics-Capstone/blob/main/pictures/rides_per_hour.png)
__Hours of the Day:__ Analyzing the hours in which rides are tken gives us better insight and we can also infure a few things:
- For annual members, between 5AM and 9AM, they have a spike of up to 200k trips recorded. Then another spike between the hours of 5PM and 7 PM. The avg length of their ride stays consistent throughout these days.

- For Casual members, there is a different story. Their spike occurs during the hours of 5PM to 7PM, but the total trips increases after 10AM. Their average ride length increases significantly during these hours too.

__Inferences:__ We can infer that based on the data from months, days and hours of bike rides that Annual members ride their bikes to commute to work hence the spike of rides per hour as mentioned above. This also explains the spike after work hours (5PM). This is why their ride lenghts are so consistent throughout the week, but trips and ride length drop during the weekends.

For Casual members, We can infer that they like to ride their bikes at their own time during the weekends, which explains their spikes. During the pre-work hours they dont take their bikes to work, so they have much less trips throughout the week, with their average ride lengths fluctuating.
  
Both riders get a spike during the warmer months, and drop off in the colder months. However, Casual riders see an increase in ride lnegth during this spike, while Annual riders keep more consistent.
  

  
Summary:
  
__Casual:__ 
- Prefer to ride during the weekends, drop off during weekdays. 
- Ride more in terms of avg ride length than members, but less in terms of trips taken.
- Spike during warmer months in the Spring or Summer.

__Annual:__ 
- Prefer to ride during the weekdays (MON - FRI), specifically during commute hours (7AM - 9AM AND 5PM - 6PM). It can be inferred they use the bikes to get to work.
- Also spike during warmer months, but stay consistent throughout the week while dropping off during the weekends. 
- Travel more often that Casual members, keeping a mjuch more consistent ride length.
  
##  Potential Marketing Strategies
After identifying differences between casual and annual riders, and making data analytic inferences, we can create marketing strategies to convert casual riders into member riders.
1. Create a subscription for Casual members during the seasons of Spring and Summer.
2. Casual riders can be offered weekend subscriptions, or seasonal.
3. Casual riders also ride longer, providing a subcription where you meet a specific ride length during the weekend can unlock discounts on prices.
4. During Spring and Summer months, create some activies or meet-ups to encourage rides.
5. Upon subscribing to the weekend membership, you can refer a friend for 15% off their first year at Cyclistic.
