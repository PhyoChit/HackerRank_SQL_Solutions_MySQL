WITH cal_total AS
(
    SELECT h.hacker_id, h.name, COUNT(challenge_id) AS total
    FROM Hackers AS h
    JOIN Challenges AS c
    ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
)

SELECT hacker_id, name, total
FROM cal_total
WHERE total IN 
(
    SELECT total
    FROM cal_total
    GROUP BY total
    HAVING (COUNT(total) < 2) OR (total = (SELECT MAX(total) FROM cal_total))
)
ORDER BY total DESC, hacker_id;
