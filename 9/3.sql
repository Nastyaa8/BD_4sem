SELECT 1; 

PRINT '����� ������������ ����� (@@ROWCOUNT): ' + CAST(@@ROWCOUNT AS VARCHAR);  
PRINT '������ SQL Server (@@VERSION): ' + @@VERSION;
PRINT '��������� ������������� �������� (@@SPID): ' + CAST(@@SPID AS VARCHAR);
PRINT '��� ��������� ������ (@@ERROR): ' + CAST(@@ERROR AS VARCHAR);
PRINT '��� ������� (@@SERVERNAME): ' + @@SERVERNAME;
PRINT '������� ����������� ���������� (@@TRANCOUNT): ' + CAST(@@TRANCOUNT AS VARCHAR);
PRINT '@@FETCH_STATUS : ' + CAST(@@FETCH_STATUS AS VARCHAR);
PRINT '������� ����������� ������� ��������� (@@NESTLEVEL): ' + CAST(@@NESTLEVEL AS VARCHAR);
