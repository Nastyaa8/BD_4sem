--вычисление значений переменной z 
DECLARE @t FLOAT = 5; 
DECLARE @x FLOAT = 3; 
DECLARE @z FLOAT;

IF @t > @x
    SET @z = POWER(SIN(@t), 2);
ELSE IF @t < @x
    SET @z = 4 * (@t + @x);
ELSE
    SET @z = 1 - EXP(@x - 2);

SELECT @z AS Result;
--преобразование полного ФИО студента в сокращенное (например, Макейчик Татьяна Леонидовна в Макейчик Т. Л.);
DECLARE @FullName NVARCHAR(100) = 'Макейчик Татьяна Леонидовна';
DECLARE @ShortName NVARCHAR(100);

SET @ShortName = LEFT(@FullName, CHARINDEX(' ', @FullName)) + ' ' +
                 LEFT(PARSENAME(REPLACE(@FullName, ' ', '.'), 2), 1) + '. ' +
                 LEFT(PARSENAME(REPLACE(@FullName, ' ', '.'), 1), 1) + '.';

SELECT @ShortName AS ShortenedName;

