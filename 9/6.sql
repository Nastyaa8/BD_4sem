SELECT 
    IDSTUDENT,
    [SUBJECT],
    NOTE,
    PDATE,
    CASE NOTE
        WHEN 9 THEN '�������'
        WHEN 4 THEN '�����������������'
        WHEN 8 THEN '������'
        WHEN 5 THEN '�������'
		WHEN 6 THEN ' ���� ��������'
		WHEN 7 THEN '���������'
        ELSE '��� ������'
    END AS ����������
FROM PROGRESS;

