--1.
--CREATE VIEW ������_�������� AS
--SELECT 
--    ������������_�������� AS ��������,
--    �������_��������� AS ���������,
--    ������������_�������� AS ������������_�_�������
--FROM ��������;
--2.
--CREATE VIEW ����_���������� AS
--SELECT 
--    ������� + ' ' + ��� + ISNULL(' ' + ��������, '') AS ���,
--    ����
--FROM ���������;
--3.
--CREATE VIEW �������_�������� AS
--SELECT 
--    ������������_�������� AS ��������, 
--    ������������_�������� AS ������������
--FROM ��������
--WHERE ������������_�������� > 100
--WITH CHECK OPTION;
--4.
--CREATE VIEW �������_������������_��_��������� AS
--SELECT 
--    �������_��������� AS ���������, 
--    AVG(������������_��������) AS �������_������������
--FROM ��������
--GROUP BY �������_���������;
-- 5. ������������� "��������_��_�������"
--CREATE VIEW ��������_��_������� AS
--SELECT TOP 100 PERCENT
--    ������������_�������� AS ��������, 
--    ������������_�������� AS ������������
--FROM ��������
--ORDER BY ������������_�������� DESC;
--6.
--���������� ������������� "����������_��������_��_���������" � ��������� � ������
--ALTER VIEW ����������_��������_��_��������� 
--WITH SCHEMABINDING AS
--SELECT 
--    �������_���������, 
--    COUNT_BIG(*) AS ����������
--FROM dbo.��������
--GROUP BY �������_���������;
