use univer
go

IF OBJECT_ID('Tech_Tran', 'TR') IS NOT NULL
    DROP TRIGGER Tech_Tran;
GO
create trigger Tech_Tran
on TEACHER after INSERT, DELETE, UPDATE
as declare @c int = (select count(TEACHER) from TEACHER)
if(@c > 20)
begin
	raiserror(N'Общее кол-во преподавателей не дожно быть > 20', 10,1);
	rollback
end
return

select*FROM TEACHER

begin tran
	insert into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) values ('FD1','ForDelete','F','ISIT');
	insert into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) values ('FD2','ForDelete','F','ISIT');
	insert into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) values ('FD3','ForDelete','F','ISIT');
	insert into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) values ('FD4','ForDelete','F','ISIT');
	insert into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) values ('FD5','ForDelete','F','ISIT');
commit tran