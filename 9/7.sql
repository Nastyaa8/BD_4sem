CREATE TABLE #TempTable (
    ID INT PRIMARY KEY,
    TextValue VARCHAR(50),
    CreatedAt DATETIME
);

DECLARE @id INT = 1;

WHILE @id <= 10
BEGIN
    INSERT INTO #TempTable (ID, TextValue, CreatedAt)
    VALUES (
        @id,
        'Строка номер ' + CAST(@id AS VARCHAR),
        GETDATE()
    );

    SET @id = @id + 1;
END;


SELECT * FROM #TempTable;

