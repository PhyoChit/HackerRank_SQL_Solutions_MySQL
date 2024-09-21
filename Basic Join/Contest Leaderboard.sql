SELECT h.hacker_id, h.name, SUM(s.score) AS total_score
FROM Hackers AS h
JOIN (SELECT hacker_id, challenge_id, MAX(score) AS score FROM Submissions 
      GROUP BY hacker_id, challenge_id) AS s
ON h.hacker_id = s.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total_score != 0
ORDER BY total_score DESC, h.hacker_id ASC
