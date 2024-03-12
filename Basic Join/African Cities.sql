-- Select the names of cities located in countries that are in the continent of Africa
SELECT City.Name  -- Specifies that we want to retrieve the name of each city
FROM City  -- From the City table
INNER JOIN Country ON City.Countrycode = Country.code -- Perform an inner join with the Country table. The join condition is that the country code in the City table matches the country code in the Country table. This links each city to its respective country.
WHERE Country.Continent = 'Africa'; -- Filter the results to include only those entries where the country's continent is Africa.
