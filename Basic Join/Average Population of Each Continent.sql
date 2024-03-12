SELECT 
    Country.Continent, -- Selects the continent from the Country table.
    FLOOR(AVG(City.Population)) -- Calculates the average population of cities for each continent and rounds down to the nearest whole number.
FROM 
    City -- From the City table
INNER JOIN 
    Country ON City.Countrycode = Country.code -- Performs an inner join with the Country table where the city's country code matches the country code in the Country table.
GROUP BY 
    Country.Continent; -- Groups the results by continent, so the average population is calculated for each continent.
