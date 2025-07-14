SELECT 
    IDSTUDENT,
    [SUBJECT],
    NOTE,
    PDATE,
    CASE NOTE
        WHEN 9 THEN 'Отлично'
        WHEN 4 THEN 'Удовлетворительно'
        WHEN 8 THEN 'Хорошо'
        WHEN 5 THEN 'Средняя'
		WHEN 6 THEN ' выше Среднего'
		WHEN 7 THEN 'Нормально'
        ELSE 'Нет оценки'
    END AS Результаты
FROM PROGRESS;

