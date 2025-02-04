-- Using UNION to combine two queries
-- Case 1: primary_flag set to Y
SELECT 
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION
-- Case 2: Employees that have only one department
SELECT
    employee_id,
    department_id
FROM Employee
GROUP BY 1 -- employee_id
HAVING COUNT(*) = 1


-- Using subqueries
SELECT 
    employee_id, 
    department_id
FROM Employee
WHERE primary_flag='Y' OR 
    employee_id in
    (SELECT 
        employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(*)=1)


-- Using Window function
SELECT
    employee_id,
    department_id
FROM
(
    SELECT 
        *,
        COUNT(employee_id) OVER(PARTITION BY employee_id) AS EmployeeCount
    FROM 
    Employee
) EmployeePartition
WHERE
    EmployeeCount = 1
    OR
    primary_flag = 'Y';