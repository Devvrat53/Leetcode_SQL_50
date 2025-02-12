-- This query is used to calculate the average experience years of employees for each project.
SELECT p.project_id, ROUND(AVG(e.experience_years), 2) AS average_years
FROM Employee e JOIN Project p ON e.employee_id = p.employee_id
GROUP BY p.project_id