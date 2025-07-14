
CREATE TABLE #EX (
    TKEY INT,
    TF NVARCHAR(100)
);

INSERT INTO #EX (TKEY, TF)
SELECT TOP (1000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), REPLICATE('X', 50)
FROM sys.all_objects;

-- 3. Создаем некластеризованный индекс с FILLFACTOR = 65
CREATE NONCLUSTERED INDEX #EX_TKEY ON #EX(TKEY)
WITH (FILLFACTOR = 65, PAD_INDEX = OFF);
-- Обратите внимание: PAD_INDEX применяется только, если используется FILLFACTOR

-- 4. Дублируем 50% строк, чтобы спровоцировать фрагментацию
INSERT TOP (50) PERCENT INTO #EX(TKEY, TF)
SELECT TKEY + 100000, TF FROM #EX;

-- 5. Проверяем уровень фрагментации
SELECT 
    ii.name AS [Индекс],
    ss.avg_fragmentation_in_percent AS [Фрагментация (%)]

FROM 
    sys.dm_db_index_physical_stats(DB_ID(N'tempdb'), OBJECT_ID('tempdb..#EX'), NULL, NULL, 'LIMITED') AS ss
JOIN 
    tempdb.sys.indexes AS ii
    ON ss.object_id = ii.object_id AND ss.index_id = ii.index_id
WHERE 
    ii.name IS NOT NULL;