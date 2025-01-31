-- Using joins
SELECT r.contest_id, ROUND((COUNT(DISTINCT u.user_id)/(SELECT COUNT(DISTINCT user_id) FROM Users))*100, 2) AS percentage
FROM Users u JOIN Register r ON u.user_id = r.user_id
GROUP BY contest_id
ORDER BY percentage DESC, r.contest_id ASC;

-- Using sub-query (Optimized)
SELECT contest_id, ROUND((COUNT(DISTINCT user_id)/(SELECT COUNT(DISTINCT user_id) FROM Users))*100, 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;