SELECT 
    CASE 
        WHEN ����������_������� BETWEEN 0 AND 99 THEN '0-99'
        WHEN ����������_������� BETWEEN 100 AND 199 THEN '100-199'
        WHEN ����������_������� >= 200 THEN '200+'
        ELSE '����������'
    END AS ��������,
    COUNT(*) AS ����������_��������
FROM 
    �����������_������
GROUP BY 
    CASE 
        WHEN ����������_������� BETWEEN 0 AND 99 THEN '0-99'
        WHEN ����������_������� BETWEEN 100 AND 199 THEN '100-199'
        WHEN ����������_������� >= 200 THEN '200+'
        ELSE '����������'
    END
ORDER BY 
    ��������;
