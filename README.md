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

  
Summary:
  
|Casual|Member|
|------|------|

  
##  Potential Marketing Strategies

# Google-Data-Analytics-Capstone
