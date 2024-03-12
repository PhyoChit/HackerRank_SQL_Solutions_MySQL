-- Calculate the difference between the maximum and minimum population across all cities
SELECT 
    (MAX(Population) - MIN(Population)) AS DIFFERENCE -- Difference between the largest and smallest population
FROM 
    CITY; -- From the table named CITY
