-- Calculate the average population for all cities, rounded down to the nearest integer
SELECT 
    FLOOR(AVG(Population)) AS AveragePopulation -- Rounds down the average population to the nearest integer
FROM 
    CITY; -- From the table named CITY
