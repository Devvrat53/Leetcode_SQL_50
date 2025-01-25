-- Using the LEFT JOIN to find the customers who have visited the store but did not make any transactions.
SELECT v.customer_id, COUNT(DISTINCT(v.visit_id)) AS count_no_trans 
FROM Visits v LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- Using subquery
SELECT v.customer_id, COUNT(DISTINCT(v.visit_id)) AS count_no_trans 
FROM Visits 
WHERE visit_id NOT IN (
    SELECT visit_id FROM Transactions
)
GROUP BY v.customer_id;