USE [4_MyBase]
--поиск студентов, у которых день рождения в следующем месяце, и определение их возраста;
SELECT 
    [NAME],
    BDAY,
    DATEDIFF(YEAR, BDAY, GETDATE()) AS Возраст
FROM STUDENT
WHERE MONTH(BDAY) = MONTH(DATEADD(MONTH, 1, GETDATE()));
--поиск дня недели, в который студенты некоторой группы сдавали экзамен по БД.
SELECT   
    DATENAME(WEEKDAY, P.PDATE) AS день_недели_экза
FROM PROGRESS P
WHERE P.SUBJECT = 'DB' 
 GROUP BY PDATE;