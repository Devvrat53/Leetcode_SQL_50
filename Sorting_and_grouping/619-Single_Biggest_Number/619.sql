-- Using HAVING COUNT(*) = 1 to find the single number
SELECT 
    MAX(num) AS num
FROM    
    (SELECT 
        num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1) single_number;


-- USING UNION to add NULL in the result set and ORDER BY to sort the result set to get the single biggest number
SELECT
    num
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1
UNION
SELECT
    NULL AS num 
ORDER BY num DESC LIMIT 1;


-- Using NOT IN and COUNT to find the single biggest number
SELECT 
    MAX(num) AS num
FROM
    MyNumbers
WHERE 
    num NOT IN (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*) > 1);


-- Using IN and COUNT to find the single biggest number
SELECT 
    MAX(num) AS num
FROM
    MyNumbers
WHERE 
    num IN (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*) = 1);


-- Using COALESCE to find the single biggest number
SELECT 
    COALESCE((SELECT 
                num 
            FROM MyNumbers 
            GROUP BY num 
            HAVING COUNT(num) = 1 
            ORDER BY num DESC LIMIT 1), NULL) AS num;

