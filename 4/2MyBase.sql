SELECT 
    �����������_������.�������_��������� AS �������, 
    �����������_������.���_��������� AS ���, 
    �����������_������.��������_��������� AS ��������,
    ��������.������������_�������� AS ��������,
    ��������.�������_��������� AS �������_���������,
    ��������.������������_�������� AS ������������_��������
FROM 
    �����������_������ �����������_������
INNER JOIN 
    �������� ��������
    ON �����������_������.������������_�������� = ��������.������������_��������
WHERE 
    ��������.������������_�������� LIKE '%��������%';
