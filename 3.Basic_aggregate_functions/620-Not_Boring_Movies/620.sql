SELECT id, movie, description, rating 
FROM Cinema 
WHERE description != 'boring' AND id MOD 2 != 0
ORDER BY rating DESC;