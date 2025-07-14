SELECT 
    CASE 
        WHEN Количество_деталей BETWEEN 0 AND 99 THEN '0-99'
        WHEN Количество_деталей BETWEEN 100 AND 199 THEN '100-199'
        WHEN Количество_деталей >= 200 THEN '200+'
        ELSE 'Неизвестно'
    END AS Диапазон,
    COUNT(*) AS Количество_операций
FROM 
    Выполненная_работа
GROUP BY 
    CASE 
        WHEN Количество_деталей BETWEEN 0 AND 99 THEN '0-99'
        WHEN Количество_деталей BETWEEN 100 AND 199 THEN '100-199'
        WHEN Количество_деталей >= 200 THEN '200+'
        ELSE 'Неизвестно'
    END
ORDER BY 
    Диапазон;
