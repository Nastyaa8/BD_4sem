SELECT IDSTUDENT, NOTE
FROM PROGRESS
WHERE NOTE > ALL (
    SELECT NOTE
    FROM PROGRESS
    WHERE SUBJECT = 'OAP'
);