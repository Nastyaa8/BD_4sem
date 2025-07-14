USE "S_MyBase"
SELECT 
    О.Наименование_операции,
    MAX(В.Количество_деталей) AS MAX_COUNT,
    MIN(В.Количество_деталей) AS MIN_COUNT,
    AVG(В.Количество_деталей) AS AVG_COUNT,
    SUM(В.Количество_деталей) AS TOTAL_COUNT,
    COUNT(*) AS OPERATION_COUNT
FROM 
    Выполненная_работа В
INNER JOIN 
    Операции О ON В.Наименование_операции = О.Наименование_операции
GROUP BY 
    О.Наименование_операции;
