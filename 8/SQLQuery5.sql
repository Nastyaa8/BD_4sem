CREATE VIEW Дисциплины AS
SELECT TOP 100 PERCENT
    [SUBJECT] AS Код, 
    SUBJECT_NAME AS Наименование_дисциплины, 
    PULPIT AS Код_кафедры
FROM [SUBJECT]
ORDER BY SUBJECT_NAME;