USE [4_MyBase]
--����� ���������, � ������� ���� �������� � ��������� ������, � ����������� �� ��������;
SELECT 
    [NAME],
    BDAY,
    DATEDIFF(YEAR, BDAY, GETDATE()) AS �������
FROM STUDENT
WHERE MONTH(BDAY) = MONTH(DATEADD(MONTH, 1, GETDATE()));
--����� ��� ������, � ������� �������� ��������� ������ ������� ������� �� ��.
SELECT   
    DATENAME(WEEKDAY, P.PDATE) AS ����_������_����
FROM PROGRESS P
WHERE P.SUBJECT = 'DB' 
 GROUP BY PDATE;