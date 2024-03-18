SELECT salary*months AS max_totalearnings, COUNT(*)
FROM EMPLOYEE
GROUP BY max_totalearnings
ORDER BY max_totalearnings DESC
LIMIT 1
