CREATE TABLE �����������_������ (
    ID INT IDENTITY(1,1) PRIMARY KEY,                        
    �������_��������� nvarchar(50) NOT NULL,                  
    ���_��������� nvarchar(50) NOT NULL,                      
    ��������_��������� nvarchar(50),                          
    ������������_�������� nvarchar(50) NOT NULL,              
    ����������_������� INT CHECK (����������_������� >= 0),    
    ���� DATE NOT NULL,                                       
    FOREIGN KEY (�������_���������, ���_���������, ��������_���������) 
        REFERENCES ���������(�������, ���, ��������),         
    FOREIGN KEY (������������_��������) 
        REFERENCES ��������(������������_��������)            
);
GO
INSERT INTO �����������_������ (�������_���������, ���_���������, ��������_���������, ������������_��������, ����������_�������, ����)
VALUES ('������', '����', '��������', '������', 100, '2025-03-14'),
       ('������', '����', '��������', '��������', 150, '2025-03-14');
GO
SELECT * FROM �����������_������;
