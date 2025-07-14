USE univer;
GO

-- Удаляем таблицу аудита, если существует
IF OBJECT_ID('TR_AUDIT', 'U') IS NOT NULL
    DROP TABLE TR_AUDIT;
GO

-- Создаем таблицу для аудита триггеров
CREATE TABLE TR_AUDIT
(
    ID int IDENTITY PRIMARY KEY,
    STMT varchar(20) CHECK (STMT IN ('INS', 'DEL', 'UPD')),
    TRNAME varchar(50),
    CC varchar(300)
);
GO

-- Удаляем триггеры, если они существуют
DROP TRIGGER IF EXISTS TR_TEACHER_INS;
DROP TRIGGER IF EXISTS TR_TEACHER_DEL;
DROP TRIGGER IF EXISTS TR_TEACHER_UPD;
DROP TRIGGER IF EXISTS TR_TEACHE;
GO


-- Триггер на вставку в TEACHER
CREATE TRIGGER TR_TEACHER_INS
ON TEACHER
AFTER INSERT
AS
BEGIN
    DECLARE @a1 varchar(20), @a2 varchar(200), @a3 char(1), @a4 varchar(16), @in varchar(300);
    PRINT N'Операция вставки';
    SET @a1 = (SELECT TEACHER FROM inserted);
    SET @a2 = (SELECT TEACHER_NAME FROM inserted);
    SET @a3 = (SELECT GENDER FROM inserted);
    SET @a4 = (SELECT PULPIT FROM inserted);
    SET @in = @a1 + N' ' + @a2 + N' ' + @a3 + N' ' + @a4;
    INSERT INTO TR_AUDIT(STMT, TRNAME, CC) VALUES ('INS', 'TR_TEACHER_INS', @in);
END
GO


-- Триггер на удаление из TEACHER
CREATE TRIGGER TR_TEACHER_DEL
ON TEACHER
AFTER DELETE
AS
BEGIN
    DECLARE @a1 varchar(20), @a2 varchar(200), @a3 char(1), @a4 varchar(16), @in varchar(300);
    PRINT N'Операция удаления';
    SET @a1 = (SELECT TEACHER FROM deleted);
    SET @a2 = (SELECT TEACHER_NAME FROM deleted);
    SET @a3 = (SELECT GENDER FROM deleted);
    SET @a4 = (SELECT PULPIT FROM deleted);
    SET @in = @a1 + N' ' + @a2 + N' ' + @a3 + N' ' + @a4;
    INSERT INTO TR_AUDIT(STMT, TRNAME, CC) VALUES ('DEL', 'TR_TEACHER_DEL', @in);
END
GO


-- Триггер на обновление в TEACHER
CREATE TRIGGER TR_TEACHER_UPD
ON TEACHER
AFTER UPDATE
AS
BEGIN
    DECLARE @a1 varchar(20), @a2 varchar(200), @a3 char(1), @a4 varchar(16);
    DECLARE @b1 varchar(20), @b2 varchar(200), @b3 char(1), @b4 varchar(16);
    DECLARE @in1 varchar(300);
    DECLARE @in2 varchar(300);

    PRINT N'Операция обновления';

    -- После обновления (новые значения)
    SET @a1 = (SELECT TEACHER FROM inserted);
    SET @a2 = (SELECT TEACHER_NAME FROM inserted);
    SET @a3 = (SELECT GENDER FROM inserted);
    SET @a4 = (SELECT PULPIT FROM inserted);
    SET @in1 = 'AFTER: ' + @a1 + N' ' + @a2 + N' ' + @a3 + N' ' + @a4;
    INSERT INTO TR_AUDIT(STMT, TRNAME, CC) VALUES ('UPD', 'TR_TEACHER_UPD', @in1);

    -- До обновления (старые значения)
    SET @b1 = (SELECT TEACHER FROM deleted);
    SET @b2 = (SELECT TEACHER_NAME FROM deleted);
    SET @b3 = (SELECT GENDER FROM deleted);
    SET @b4 = (SELECT PULPIT FROM deleted);
    SET @in2 = 'BEFORE: ' + @b1 + N' ' + @b2 + N' ' + @b3 + N' ' + @b4;
    INSERT INTO TR_AUDIT(STMT, TRNAME, CC) VALUES ('UPD', 'TR_TEACHER_UPD', @in2);
END
GO


-- Универсальный триггер на все операции (вставка, удаление, обновление)
CREATE TRIGGER TR_TEACHE
ON TEACHER
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    DECLARE @a1 varchar(20), @a2 varchar(200), @a3 char(1), @a4 varchar(16), @in varchar(300);
    DECLARE @ins int = (SELECT COUNT(*) FROM inserted), @del int = (SELECT COUNT(*) FROM deleted);

    IF @ins > 0 AND @del = 0
    BEGIN
        PRINT N'Операция вставки';
        SET @a1 = (SELECT TEACHER FROM inserted);
        SET @a2 = (SELECT TEACHER_NAME FROM inserted);
        SET @a3 = (SELECT GENDER FROM inserted);
        SET @a4 = (SELECT PULPIT FROM inserted);
        SET @in = @a1 + N' ' + @a2 + N' ' + @a3 + N' ' + @a4;
        INSERT INTO TR_AUDIT(STMT, TRNAME, CC) VALUES ('INS', 'TR_TEACHE', @in);
    END
    ELSE IF @ins = 0 AND @del > 0
    BEGIN
        PRINT N'Операция удаления';
        SET @a1 = (SELECT TEACHER FROM deleted);
        SET @a2 = (SELECT TEACHER_NAME FROM deleted);
        SET @a3 = (SELECT GENDER FROM deleted);
        SET @a4 = (SELECT PULPIT FROM deleted);
        SET @in = @a1 + N' ' + @a2 + N' ' + @a3 + N' ' + @a4;
        INSERT INTO TR_AUDIT(STMT, TRNAME, CC) VALUES ('DEL', 'TR_TEACHE', @in);
    END
    ELSE IF @ins > 0 AND @del > 0
    BEGIN
        PRINT N'Операция обновления';
        SET @a1 = (SELECT TEACHER FROM inserted);
        SET @a2 = (SELECT TEACHER_NAME FROM inserted);
        SET @a3 = (SELECT GENDER FROM inserted);
        SET @a4 = (SELECT PULPIT FROM inserted);
        SET @in = 'INS: ' + @a1 + N' ' + @a2 + N' ' + @a3 + N' ' + @a4;
        INSERT INTO TR_AUDIT(STMT, TRNAME, CC) VALUES ('UPD', 'TR_TEACHE', @in);

        SET @a1 = (SELECT TEACHER FROM deleted);
        SET @a2 = (SELECT TEACHER_NAME FROM deleted);
        SET @a3 = (SELECT GENDER FROM deleted);
        SET @a4 = (SELECT PULPIT FROM deleted);
        SET @in = 'DEL: ' + @a1 + N' ' + @a2 + N' ' + @a3 + N' ' + @a4;
        INSERT INTO TR_AUDIT(STMT, TRNAME, CC) VALUES ('UPD', 'TR_TEACHE', @in);
    END
END
GO


-- Тестируем вставку
DELETE FROM TEACHER WHERE TEACHER = 'NOA';
GO

INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('NOA', 'Olga Alexandrovna Nistyuk', 'F', 'ISIT');
GO

-- Проверяем аудит
SELECT * FROM TR_AUDIT;
GO

-- Тестируем удаление
DELETE FROM TEACHER WHERE TEACHER = 'NOA';
GO

-- Проверяем аудит
SELECT * FROM TR_AUDIT;
GO

-- Для теста обновления вставим сначала заново
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('NOA', 'Olga Alexandrovna Nistyuk', 'F', 'ISIT');
GO

DELETE FROM TEACHER WHERE TEACHER = 'XXX';
GO
-- Тестируем обновление
UPDATE TEACHER SET TEACHER = 'XXX' WHERE TEACHER_NAME = 'Olga Alexandrovna Nistyuk';
GO

-- Проверяем аудит и содержимое TEACHER
SELECT * FROM TR_AUDIT;
GO

SELECT * FROM TEACHER;
GO
