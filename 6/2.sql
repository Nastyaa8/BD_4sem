USE "4_MyBase"
SELECT 
    GRADE,
    COUNT(*) AS GRADE_COUNT
FROM 
    (SELECT 
        CASE 
            WHEN NOTE BETWEEN 5 AND 6 THEN '5-6'
            WHEN NOTE BETWEEN 7 AND 8 THEN '7-8'
            WHEN NOTE BETWEEN 9 AND 10 THEN '9-10'
            ELSE 'Другие'
        END AS GRADE
      
    FROM 
        PROGRESS) AS Subquery
GROUP BY 
    GRADE
ORDER BY 
    GRADE DESC;
