-- 1. ����� ���� ����� � �������� �� ������� "���������"
SELECT * FROM ���������;
GO

-- 2. ����� ������ �������� "�������" � "���"
SELECT �������, ��� FROM ���������;
GO

-- 3. ������� ���������� ����� � ������� "���������"
SELECT COUNT(*) FROM ���������;
GO

-- 4. ��������� �������� � ������� � ������� UPDATE (������� ������� ��� �������)
UPDATE ���������
SET ������� = '1112223333'
WHERE ������� = '������';
GO

-- 5. �������� ���������� ��������� (������� �������, ��� � ������� ��� �������)
SELECT �������, ���, ������� FROM ���������
WHERE ������� = '������';
GO

--6.�������� ����� �������
ALTER TABLE ���������
Add ����_�������� DATE;
GO
--7.���������� ����������� NOT NULL
ALTER TABLE ���������
ALTER COLUMN ����_�������� DATE NOT NULL;
GO

--8.�������� ����� ������� 
EXEC sp_help '���������';
GO

--9.�������� �������
ALTER TABLE ���������
DROP COLUMN ����_��������;
GO


