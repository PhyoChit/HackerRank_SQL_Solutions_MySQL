WITH p AS (SELECT
            MIN(LAT_N) AS a,
            MIN(LONG_W) AS b,
            MAX(LAT_N) AS c,
            MAX(LONG_W) AS d
           FROM STATION)

SELECT ROUND((c - a) + (d - b), 4) AS distance
FROM p
