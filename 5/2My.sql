USE "S_MyBase";

SELECT
    ���������.�������,
    ���������.���,
    ���������.��������,
    �����������_������.������������_��������,
    �����������_������.����������_�������,
    �����������_������.����
FROM
    �����������_������
JOIN
    ���������
    ON �����������_������.�������_��������� = ���������.�������
    AND �����������_������.���_��������� = ���������.���
    AND �����������_������.��������_��������� = ���������.��������
JOIN
    ��������
    ON �����������_������.������������_�������� = ��������.������������_��������
JOIN
    (
        SELECT ������������_��������
        FROM ��������
        WHERE ������������_�������� LIKE '%������%'
    ) AS ������_��������
    ON �����������_������.������������_�������� = ������_��������.������������_��������;
