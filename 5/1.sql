USE "4_MyBase"
SELECT PULPIT.PULPIT_NAME
FROM PULPIT
WHERE PULPIT.FACULTY IN (
    SELECT PROFESSION.FACULTY
    FROM PROFESSION
    WHERE PROFESSION.PROFESSION_NAME LIKE '%Technology%'
);