-- Calculate the total population of cities in the California district
SELECT 
    Sum(Population) -- Sums up the population of all rows that meet the condition in the WHERE clause
FROM 
    CITY -- From the table named CITY
WHERE 
    District = 'California'; -- The condition to filter rows: select only those cities within the 'California' district
