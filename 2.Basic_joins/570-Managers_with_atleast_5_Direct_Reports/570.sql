-- Use the subquery to find the ID of the manager having DISTINCT Id >= 5 and print the name of the manager
SELECT name FROM Employee 
WHERE Id IN (SELECT managerId FROM Employee
GROUP BY managerId 
HAVING (COUNT(DISTINCT Id)) >= 5);