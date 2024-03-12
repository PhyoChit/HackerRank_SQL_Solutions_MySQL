-- Calculate the total population of cities in Japan
SELECT 
    SUM(Population) AS TotalPopulation -- Sums up the population for all rows that meet the condition
FROM 
    CITY -- From the table named CITY
WHERE 
    CountryCode = 'JPN'; -- The condition to filter rows: select only those cities in Japan ('JPN')
