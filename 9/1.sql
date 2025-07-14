DECLARE 
    @charVar CHAR(10) = 'Привет',   
    @varcharVar VARCHAR(50) = 'Мир', 
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

PRINT 'Значение переменной charVar: ' + @charVar;       
PRINT 'Значение переменной varcharVar: ' + @varcharVar;
PRINT 'Значение переменной intVar: ' + CAST(@intVar AS VARCHAR);       
PRINT 'Значение переменной smallintVar: ' + CAST(@smallintVar AS VARCHAR); 
PRINT 'Значение переменной tinyintVar: ' + CAST(@tinyintVar AS VARCHAR);   
PRINT 'Значение переменной numericVar: ' + CAST(@numericVar AS VARCHAR);   
