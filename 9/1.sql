DECLARE 
    @charVar CHAR(10) = '������',   
    @varcharVar VARCHAR(50) = '���', 
    @datetimeVar DATETIME,           
    @timeVar TIME,                   
    @intVar INT,                     
    @smallintVar SMALLINT,           
    @tinyintVar TINYINT,             
    @numericVar NUMERIC(12, 5);      

SET @datetimeVar = '25-04-2025 15:30:00';   
SET @timeVar = '12:45:30';                   
SET @intVar = 100;                           
SET @smallintVar = 32767;                    
SET @tinyintVar = 255;                       
SET @numericVar = 123456.78901;              

SELECT 
    @charVar AS charVar,                   
    @varcharVar AS varcharVar,             

    @datetimeVar AS datetimeVar,           
    @timeVar AS timeVar,                   

    @intVar AS intVar,                     
    @smallintVar AS smallintVar,           
    @tinyintVar AS tinyintVar,             
    @numericVar AS numericVar;             

PRINT '�������� ���������� charVar: ' + @charVar;       
PRINT '�������� ���������� varcharVar: ' + @varcharVar;
PRINT '�������� ���������� intVar: ' + CAST(@intVar AS VARCHAR);       
PRINT '�������� ���������� smallintVar: ' + CAST(@smallintVar AS VARCHAR); 
PRINT '�������� ���������� tinyintVar: ' + CAST(@tinyintVar AS VARCHAR);   
PRINT '�������� ���������� numericVar: ' + CAST(@numericVar AS VARCHAR);   
