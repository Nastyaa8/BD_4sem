use univer
go

DROP TRIGGER DDL_PRODAJI ON DATABASE;
go

create trigger DDL_PRODAJI on database for DDL_DATABASE_LEVEL_EVENTS as   
begin
    DECLARE @EventType NVARCHAR(100) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)');
    DECLARE @ObjectName NVARCHAR(255) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(255)');
    DECLARE @ObjectType NVARCHAR(100) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'NVARCHAR(100)');
    PRINT N'Обнаружено DDL-событие:';
    PRINT N'Тип события: ' + @EventType;
    PRINT N'Имя объекта: ' + @ObjectName;
    PRINT N'Тип объекта: ' + @ObjectType;
  IF @EventType IN ('CREATE_TABLE', 'DROP_TABLE')
  begin
       DECLARE @Message NVARCHAR(500) = N'Операция ' + @EventType + 
                                        N' над таблицей ' + @ObjectName + 
                                        N' запрещена в базе данных UNIVER.';
        PRINT @Message;
        RAISERROR(@Message, 16, 1);
        ROLLBACK;
   end;
end
go

drop TABLE TEACHER;
go

select * from TEACHER;
go


CREATE TABLE TEACHER
(
    TEACHER    CHAR(10) CONSTRAINT TEACHER_PK PRIMARY KEY,
    TEACHER_NAME  VARCHAR(100), 
    GENDER     CHAR(1) CHECK (GENDER IN ('M', 'F')),
    PULPIT   CHAR(20) CONSTRAINT TEACHER_PULPIT_FK FOREIGN KEY REFERENCES PULPIT(PULPIT) 
);
go

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES 
    ('SMLV', 'Smelov Vladimir Vladislavovich', 'M', 'ISIT'),
    ('DTK', 'Dyatko Alexander Arkadievich', 'M', 'LV'),
    ('URB', 'Urbanovich Pavel Pavlovich', 'M', 'ISIT'),
    ('GRN', 'Gurin Nikolay Ivanovich', 'M', 'ISIT'),
    ('ZLK', 'Zhilak Nadezhda Alexandrovna', 'F', 'ISIT'),
    ('MRZ', 'Moroz Elena Stanislavovna', 'F', 'ISIT'),
    ('BRTSHVCH', 'Bartashevich Svyatoslav Alexandrovich', 'M', 'PIAHP'),
    ('ARS', 'Arsentiev Vitaliy Arsentievich', 'M', 'PIAHP'),
    ('NVRV', 'Neverov Alexander Vasilievich', 'M', 'MIEP'),
    ('RVKCH', 'Rovkach Andrey Ivanovich', 'M', 'LV'),
    ('DMDK', 'Demidko Marina Nikolaevna', 'F', 'LPISPS'),
    ('BRG', 'Burganskaya Tatyana Minaevna', 'F', 'LPISPS'),
    ('RZHK', 'Rozhkov Leonid Nikolaevich', 'M', 'LV'),
    ('ZVGTSV', 'Zvyagintsev Vyacheslav Borisovich', 'M', 'LZIDV'),
    ('BZBRDV', 'Bezborodov Vladimir Stepanovich', 'M', 'OH'),
    ('NSKVTS', 'Naskovets Mikhail Trofimovich', 'M', 'TL');
go
