SELECT 1; 

PRINT 'Число обработанных строк (@@ROWCOUNT): ' + CAST(@@ROWCOUNT AS VARCHAR);  
PRINT 'Версия SQL Server (@@VERSION): ' + @@VERSION;
PRINT 'Системный идентификатор процесса (@@SPID): ' + CAST(@@SPID AS VARCHAR);
PRINT 'Код последней ошибки (@@ERROR): ' + CAST(@@ERROR AS VARCHAR);
PRINT 'Имя сервера (@@SERVERNAME): ' + @@SERVERNAME;
PRINT 'Уровень вложенности транзакции (@@TRANCOUNT): ' + CAST(@@TRANCOUNT AS VARCHAR);
PRINT '@@FETCH_STATUS : ' + CAST(@@FETCH_STATUS AS VARCHAR);
PRINT 'Уровень вложенности текущей процедуры (@@NESTLEVEL): ' + CAST(@@NESTLEVEL AS VARCHAR);
