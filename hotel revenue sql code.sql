-- appending the tables for 2018, 2019 and 2020 year together
WITH Hotels AS (
SELECT * FROM [2018_data]
UNION
SELECT * FROM [2019_data]
UNION
SELECT * FROM [2020_data])

-- joining the market_segment and meal_cost together with the appended data for the 2018, 2019 and 2020 year

SELECT * 
	FROM Hotels H
LEFT JOIN dbo.market_segment MS
ON H.market_segment = MS.market_segment
LEFT JOIN dbo.meal_cost MC
ON H.meal = MC.meal


-- exploratory data analysis

-- calculating the hotel revenue for each year

WITH Hotels AS (
SELECT * FROM [2018_data]
UNION
SELECT * FROM [2019_data]
UNION
SELECT * FROM [2020_data])

SELECT 
arrival_date_year AS Year,
hotel,
ROUND(SUM((stays_in_weekend_nights+stays_in_week_nights) * adr), 2) AS Revenue 
FROM Hotels
GROUP BY arrival_date_year, hotel;