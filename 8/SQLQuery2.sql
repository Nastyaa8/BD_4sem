CREATE VIEW ����������_������ AS
SELECT 
    f.FACULTY_NAME AS ���������, 
    COUNT(p.PULPIT) AS ����������_������
FROM FACULTY f
LEFT JOIN PULPIT p ON f.FACULTY = p.FACULTY
GROUP BY f.FACULTY_NAME;