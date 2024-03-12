-- Selects the pivoted columns for each occupation with conditional aggregation
SELECT 
    -- For each group of names having the same row number, select the name if it belongs to 'Doctor'
    -- Otherwise, return NULL. Then, use MAX to effectively pick the name (since there's only one name per group per occupation)
    MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME END) AS Doctor, 
    -- Repeat the process for 'Professor'
    MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME END) AS Professor, 
    -- Repeat the process for 'Singer'
    MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME END) AS Singer, 
    -- Repeat the process for 'Actor'
    MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME END) AS Actor 
-- From a subquery that assigns a row number to each name within each occupation group
FROM (
    -- Select all columns from OCCUPATIONS and also generate a row number (RN)
    -- Row numbers are reset and start from 1 for each occupation group
    SELECT *, ROW_NUMBER() OVER(PARTITION BY OCCUPATION ORDER BY NAME) AS RN 
    FROM OCCUPATIONS
    -- Alias the subquery as 'temp' for use in the outer query
) AS temp 
-- Group the results by the row number to align names across occupations in the output
GROUP BY RN 
-- Order the final result set by the row number to maintain the alphabetical ordering within each occupation
ORDER BY RN;
