-- Write your MySQL query statement below
SELECT tweet_id FROM Tweets
WHERE (SELECT COUNT(content) > 15);