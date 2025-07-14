BEGIN TRY
   
    DECLARE @result INT;
    SET @result = 10 / 0;  
END TRY
BEGIN CATCH  
    PRINT '��� ������ (ERROR_NUMBER): ' + CAST(ERROR_NUMBER() AS VARCHAR);  
    PRINT '��������� �� ������ (ERROR_MESSAGE): ' + ERROR_MESSAGE();           
    PRINT '����� ������ � ������� (ERROR_LINE): ' + CAST(ERROR_LINE() AS VARCHAR);  
    PRINT '��� ��������� � ������� (ERROR_PROCEDURE): ' + ISNULL(ERROR_PROCEDURE(), 'NULL'); 
    PRINT '������� ����������� ������ (ERROR_SEVERITY): ' + CAST(ERROR_SEVERITY() AS VARCHAR);  
    PRINT '����� ������ (ERROR_STATE): ' + CAST(ERROR_STATE() AS VARCHAR);
END CATCH;
