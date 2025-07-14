DECLARE @number INT = 5;

PRINT 'Значение переменной: ' + CAST(@number AS VARCHAR(10));

RETURN


DECLARE @textNumber VARCHAR(10) = '6';
PRINT 'Значение переменной: ' + @textNumber;
