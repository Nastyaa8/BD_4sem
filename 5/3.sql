USE "4_MyBase"
SELECT DISTINCT PULPIT.PULPIT_NAME
FROM PULPIT
INNER JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
INNER JOIN PROFESSION ON FACULTY.FACULTY = PROFESSION.FACULTY
WHERE PROFESSION.PROFESSION_NAME LIKE '%Technology%';