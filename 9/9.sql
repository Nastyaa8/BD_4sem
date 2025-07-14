BEGIN TRY
   
    DECLARE @result INT;
    SET @result = 10 / 0;  
END TRY
BEGIN CATCH  
    PRINT 'Код ошибки (ERROR_NUMBER): ' + CAST(ERROR_NUMBER() AS VARCHAR);  
    PRINT 'Сообщение об ошибке (ERROR_MESSAGE): ' + ERROR_MESSAGE();           
    PRINT 'Номер строки с ошибкой (ERROR_LINE): ' + CAST(ERROR_LINE() AS VARCHAR);  
    PRINT 'Имя процедуры с ошибкой (ERROR_PROCEDURE): ' + ISNULL(ERROR_PROCEDURE(), 'NULL'); 
    PRINT 'Уровень серьезности ошибки (ERROR_SEVERITY): ' + CAST(ERROR_SEVERITY() AS VARCHAR);  
    PRINT 'Метка ошибки (ERROR_STATE): ' + CAST(ERROR_STATE() AS VARCHAR);
END CATCH;
