-- Write your MySQL query statement below
SELECT tgt.unique_id, src.name FROM EmployeeUNI AS tgt
RIGHT JOIN Employees AS src ON 
tgt.id = src.id