-- Define a CTE named 'RankedOccupations' to preprocess the data.
-- This CTE will assign a unique row number to each name within its occupation group, ordered alphabetically.
-- This ordering is crucial for the final alignment of names under their respective occupations.
WITH RankedOccupations AS (
    SELECT
        -- Select occupation and name directly from the original table.
        OCCUPATION,
        NAME,
        -- Generate a row number for each name, partitioned by occupation.
        -- This means the row numbering starts over for each occupation group.
        -- The row numbers are assigned based on alphabetical order of names within each occupation.
        ROW_NUMBER() OVER(PARTITION BY OCCUPATION ORDER BY NAME) AS RN
    FROM OCCUPATIONS
)

-- After defining the CTE, proceed to use it for the final selection.
SELECT 
    -- For each group of names that have been assigned the same row number (RN) across different occupations,
    -- select the doctor's name. If there's no doctor for a specific row number, this will be NULL.
    MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME END) AS Doctor, 
    -- Similarly, select the professor's name for the same row number. Return NULL if there isn't one.
    MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME END) AS Professor, 
    -- Select the singer's name for the row. Again, NULL is returned for rows without a singer.
    MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME END) AS Singer, 
    -- Select the actor's name for the row, with NULL for rows without an actor.
    MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME END) AS Actor 
FROM RankedOccupations
-- Group the query results by RN, the row number assigned within each occupation group.
-- This is essential for aligning names from different occupations in the output,
-- ensuring that each row in the final result corresponds to the same 'rank' across occupations.
GROUP BY RN 
-- Order the results by RN to maintain the alphabetical order of names within each occupation in the final output.
-- This ensures that the first row contains the first names alphabetically from each occupation, and so on.
ORDER BY RN;
