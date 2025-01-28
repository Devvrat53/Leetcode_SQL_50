-- Using DATEDIFF function to compare the recordDate of two consecutive days
SELECT w2.id FROM Weather w1
JOIN Weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = -1 
AND w2.temperature > w1.temperature


-- Using DATEADD function to compare the recordDate of two consecutive days
SELECT w1.id FROM weather w1
JOIN weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
AND w1.temperature > w2.temperature;


