WITH p AS (
SELECT 
    MIN(LAT_N) AS a,
    MAX(LAT_N) AS b,
    MIN(LONG_W) AS c,
    MAX(LONG_W) AS d
FROM STATION
)

SELECT ROUND(SQRT(POW(b - a, 2) + POW(d - c, 2)), 4)
FROM p
