SELECT ROUND(AVG(LAT_N), 4) AS median
FROM
(SELECT 
    LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn
    FROM STATION 
) AS subq
WHERE rn = (SELECT CEIL(COUNT(*)+1)/2 FROM STATION)
      OR rn = (SELECT FLOOR(COUNT(*)+1)/2 FROM STATION)
