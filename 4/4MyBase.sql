SELECT 
    �����������_������.�������_��������� AS �������,
    �����������_������.���_��������� AS ���,
    ISNULL(�����������_������.��������_���������, '***') AS ��������,
    ��������.������������_�������� AS ��������
   
FROM 
    �����������_������ 
LEFT OUTER JOIN 
    ��������  ON �����������_������.������������_�������� = ��������.������������_��������
ORDER BY 
    ��������;
