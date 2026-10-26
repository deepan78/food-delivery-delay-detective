# Food Delivery Delay Detective | Power BI & SQL

## Project Overview

Food Delivery Delay Detective is a data analytics project that explores food delivery performance and investigates factors associated with delivery delays. Using SQL for data analysis and Power BI for interactive reporting, this project aims to turn raw order data into meaningful business insights.

## Business Problem

Delivery delays can affect customer satisfaction, restaurant performance, and overall delivery operations.

The objective of this project is to analyze delivery data, identify patterns associated with late deliveries, and highlight areas where operational improvements may be needed.

## Project Objectives

- Measure overall delivery performance using key performance indicators (KPIs).
- Analyze delivery delays across traffic levels, weather conditions, and delivery distances.
- Evaluate restaurant preparation time and restaurant performance.
- Explore driver performance and customer ratings.
- Examine daily delivery trends.
- Present findings through an interactive Power BI dashboard.

## Tools and Technologies

- **Power BI:** Interactive dashboards, charts, KPI cards, and data visualization.
- **MySQL:** SQL queries, aggregations, ranking, and analytical comparisons.
- **CSV:** Dataset storage and data dictionary.

## Dataset Description

The project dataset contains 50,000 food delivery orders and 42 columns, covering October 1–30, 2025.

The dataset includes information about:

- Order date and time
- Customer and restaurant details
- Restaurant preparation time
- Driver experience and ratings
- Delivery distance
- Traffic and weather conditions
- Estimated and actual delivery times
- Delivery delays and late-delivery indicators
- Order status and cancellation details
- Order amounts, discounts, fees, and tips
- Customer ratings and payment methods

A separate data dictionary explains the dataset columns and their definitions.

## Key Performance Indicators (KPIs)

The analysis focuses on the following metrics:

- Total Orders
- Completed Orders
- Cancelled Orders
- On-Time Deliveries
- Late Deliveries
- Late Delivery Percentage
- Average Delivery Time
- Average Delivery Delay

## SQL Analysis

The SQL analysis covers:

1. Data inspection and table structure.
2. Delivery delay and cancellation metrics.
3. Delivery performance by restaurant preparation time.
4. Restaurant performance comparisons and rankings.
5. Driver performance analysis.
6. Customer ratings and delivery delays.
7. Daily delivery trends using SQL window functions.
8. Delay categorization and comparative analysis.

The SQL script is written for MySQL and uses the `food_delivery_master` table.

## Power BI Dashboard

The Power BI dashboard is designed to make delivery performance easier to understand through visual reporting and comparisons.

The intended analytical areas include:

- Overall delivery performance
- Delay patterns across operational conditions
- Restaurant and driver performance
- Customer ratings and delivery outcomes

**Dashboard Preview:** Add screenshots of your Power BI report to the repository to display the dashboard directly on this page.

## Business Value

This project demonstrates how data analytics can help businesses:

- Identify operational areas associated with delivery delays.
- Compare restaurant and driver performance.
- Understand delivery patterns across different conditions.
- Monitor delivery KPIs.
- Support data-informed operational decisions.

These findings can help guide further investigation and improvement efforts. The dataset alone does not establish that any particular factor causes delays.

## Repository Structure

```text
food-delivery-delay-detective/
│
├── README.md
├── analysis_queries.sql
├── delevery_delay_dashboard.pbix
├── food_delivery_master.csv
└── food_delivery_data_dictionary.csv
```

## How to Run the Project

### 1. Explore the Dataset

Open `food_delivery_master.csv` using Excel or another compatible data tool.

### 2. Run the SQL Analysis

- Install MySQL and use a compatible SQL client.
- Create a database named `mydb`, if it does not already exist.
- Import the dataset into a table named `food_delivery_master`.
- Open `analysis_queries.sql` and execute the queries.

Ensure that the imported table's column names and data types are compatible with the SQL script.

### 3. Open the Power BI Dashboard

- Install Power BI Desktop.
- Open `delevery_delay_dashboard.pbix`.
- If prompted, update the data source path to your local dataset.
- Refresh the data and verify that the report visuals load correctly.

## Limitations

- The dataset covers only October 2025, so the findings may not represent other months or seasons.
- The analysis identifies associations and patterns, not proven causal relationships.
- Cancelled orders may not have actual delivery durations or customer ratings.
- Findings depend on the quality and accuracy of the supplied dataset.

## Skills Demonstrated

- Data analysis and exploratory analysis
- SQL querying and aggregation
- Common table expressions and window functions
- KPI definition and calculation
- Power BI dashboard development
- Business problem-solving
- Data interpretation and reporting

## Conclusion

Food Delivery Delay Detective demonstrates an end-to-end analytics workflow, from structured data analysis using SQL to visual reporting in Power BI. The project focuses on understanding delivery performance and identifying opportunities for data-driven operational improvements.

---

**Author:** Your Name

**GitHub:** Add your GitHub profile URL here

**LinkedIn:** Add your LinkedIn profile URL here
