USE "S_MyBase"
SELECT 
    �.������������_��������,
    MAX(�.����������_�������) AS MAX_COUNT,
    MIN(�.����������_�������) AS MIN_COUNT,
    AVG(�.����������_�������) AS AVG_COUNT,
    SUM(�.����������_�������) AS TOTAL_COUNT,
    COUNT(*) AS OPERATION_COUNT
FROM 
    �����������_������ �
INNER JOIN 
    �������� � ON �.������������_�������� = �.������������_��������
GROUP BY 
    �.������������_��������;
