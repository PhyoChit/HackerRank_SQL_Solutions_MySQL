SELECT SUM(City.Population) -- Calculates the total population of cities.
FROM City 
INNER JOIN Country On City.Countrycode = Country.code -- Joins the City table with the Country table where the city's country code matches the country code in the Country table.
WHERE Country.Continent = 'Asia' -- Filters the results to include only those countries that are in the continent of Asia.
