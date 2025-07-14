USE SAA_MyBase;  -- �������� "I_MyBase" �� ��� ����� ���� ������

CREATE TABLE �������� (
    ID_�������� INT PRIMARY KEY IDENTITY(1,1),
    ������������_�������� NVARCHAR(255) NOT NULL,
    �������_��������� NVARCHAR(50) NOT NULL
);

CREATE TABLE ��������� (
    ID_��������� INT PRIMARY KEY IDENTITY(1,1),
    ������� NVARCHAR(50) NOT NULL,
    ��� NVARCHAR(50) NOT NULL,
    �������� NVARCHAR(50),
    ����� NVARCHAR(255),
    ������� VARCHAR(20),
    ���� INT
);

CREATE TABLE ����_������ (
    ID_����� INT PRIMARY KEY IDENTITY(1,1),
    ID_��������� INT NOT NULL,
    ID_�������� INT NOT NULL,
    ����������_������� INT NOT NULL,
    ���� DATE NOT NULL,
    FOREIGN KEY (ID_���������) REFERENCES ���������(ID_���������),
    FOREIGN KEY (ID_��������) REFERENCES ��������(ID_��������)
);