USE [4_MyBase];

DECLARE @subject_list NVARCHAR(MAX) = '';
DECLARE @subject_name NVARCHAR(100);

DECLARE SubjectCursor CURSOR FOR 
SELECT RTRIM(SUBJECT_NAME) FROM SUBJECT 
WHERE PULPIT = 'ISIT'
ORDER BY SUBJECT_NAME;

OPEN SubjectCursor;
FETCH NEXT FROM SubjectCursor INTO @subject_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF LEN(@subject_list) > 0
        SET @subject_list = @subject_list + ', ' + @subject_name;
    ELSE
        SET @subject_list = @subject_name;

    FETCH NEXT FROM SubjectCursor INTO @subject_name;
END

CLOSE SubjectCursor;
DEALLOCATE SubjectCursor;

PRINT '���������� ������� ����: ' + @subject_list;

---------------------------------------------------

-- 2. ������������ ���������� � ����������� �������
-- 2.1 ��������� ������
DECLARE @local_student_name NVARCHAR(100);

DECLARE LocalStudentCursor CURSOR LOCAL FOR
SELECT NAME FROM STUDENT 
WHERE IDGROUP IN (SELECT IDGROUP FROM GROUPS WHERE FACULTY = 'IT')
ORDER BY NAME;

OPEN LocalStudentCursor;

FETCH NEXT FROM LocalStudentCursor INTO @local_student_name;
PRINT '��������� ������ - ������ �������: ' + @local_student_name;

FETCH NEXT FROM LocalStudentCursor INTO @local_student_name;
PRINT '��������� ������ - ������ �������: ' + @local_student_name;

CLOSE LocalStudentCursor;
DEALLOCATE LocalStudentCursor;

---------------------------------------------------

-- 2.2 ���������� ������ 
DECLARE @global_student_name NVARCHAR(100);

DECLARE GlobalStudentCursor CURSOR GLOBAL FOR
SELECT NAME FROM STUDENT 
WHERE IDGROUP IN (SELECT IDGROUP FROM GROUPS WHERE FACULTY = 'IT')
ORDER BY NAME;

OPEN GlobalStudentCursor;

FETCH NEXT FROM GlobalStudentCursor INTO @global_student_name;
PRINT '���������� ������ - ������ �������: ' + @global_student_name;

FETCH NEXT FROM GlobalStudentCursor INTO @global_student_name;
PRINT '���������� ������ - ������ �������: ' + @global_student_name;

CLOSE GlobalStudentCursor;
DEALLOCATE GlobalStudentCursor;

---------------------------------------------------

-- 3. ������������ STATIC � DYNAMIC �������



-- 3.1 ����������� ������
IF OBJECT_ID('tempdb..#TempProgress') IS NOT NULL DROP TABLE #TempProgress;

CREATE TABLE #TempProgress (
    StudentID INT,
    Subject CHAR(10),
    Note INT
);

INSERT INTO #TempProgress
SELECT IDSTUDENT, SUBJECT, NOTE 
FROM PROGRESS 
WHERE SUBJECT = 'OAP' AND NOTE >= 4;

DECLARE @student_id INT, @subject CHAR(10), @note INT;

DECLARE StaticCursor CURSOR LOCAL STATIC FOR
SELECT StudentID, Subject, Note FROM #TempProgress
ORDER BY StudentID;

OPEN StaticCursor;
PRINT '���������� ����� � ����������� �������: ' + CAST(@@CURSOR_ROWS AS VARCHAR(10));

-- ��������� ����� �������� ������� (�� ��������)
UPDATE #TempProgress SET Note = 10 WHERE StudentID = 1001;
DELETE FROM #TempProgress WHERE StudentID = 1002;
INSERT INTO #TempProgress VALUES (1004, 'OAP', 7);

PRINT '������ �� ������������ �������:';
FETCH NEXT FROM StaticCursor INTO @student_id, @subject, @note;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT CAST(@student_id AS VARCHAR) + ' | ' + @subject + ' | ' + CAST(@note AS VARCHAR);
    FETCH NEXT FROM StaticCursor INTO @student_id, @subject, @note;
END

CLOSE StaticCursor;
DEALLOCATE StaticCursor;

PRINT '���������� ������ � �������:';
SELECT * FROM #TempProgress ORDER BY StudentID;
DROP TABLE #TempProgress;

---------------------------------------------------

-- 3.2 ������������ ������
IF OBJECT_ID('tempdb..#TempProgress1') IS NOT NULL DROP TABLE #TempProgress1;

CREATE TABLE #TempProgress1 (
    StudentID1 INT,
    Subject1 CHAR(10),
    Note1 INT
);

INSERT INTO #TempProgress1
SELECT IDSTUDENT, SUBJECT, NOTE 
FROM PROGRESS 
WHERE SUBJECT = 'DB' AND NOTE >= 4;

DECLARE @student_id1 INT, @subject1 CHAR(10), @note1 INT;

DECLARE DynamicCursor CURSOR LOCAL DYNAMIC FOR
SELECT StudentID1, Subject1, Note1 FROM #TempProgress1
ORDER BY StudentID1;

OPEN DynamicCursor;

-- ��������� ���������� �����
UPDATE #TempProgress1 SET Note1 = 9 WHERE StudentID1 = 1014;
DELETE FROM #TempProgress1 WHERE StudentID1 = 1015;
INSERT INTO #TempProgress1 VALUES (1017, 'DB', 6);

PRINT '������ �� ������������� �������:';
FETCH NEXT FROM DynamicCursor INTO @student_id1, @subject1, @note1;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT CAST(@student_id1 AS VARCHAR) + ' | ' + @subject1 + ' | ' + CAST(@note1 AS VARCHAR);
    FETCH NEXT FROM DynamicCursor INTO @student_id1, @subject1, @note1;
END

CLOSE DynamicCursor;
DEALLOCATE DynamicCursor;

PRINT '���������� ������ � �������:';
SELECT * FROM #TempProgress1 ORDER BY StudentID1;

DROP TABLE #TempProgress1;

---------------------------------------------------

-- 4. SCROLL ������
IF OBJECT_ID('tempdb..#TempSubjects') IS NOT NULL DROP TABLE #TempSubjects;

CREATE TABLE #TempSubjects (
    RowNum INT,
    SubjectName NVARCHAR(100),
    Faculty CHAR(10)
);

INSERT INTO #TempSubjects
SELECT ROW_NUMBER() OVER (ORDER BY SUBJECT_NAME), SUBJECT_NAME, 'ISIT'
FROM SUBJECT
WHERE PULPIT = 'ISIT';

DECLARE @row_num INT, @scroll_subject NVARCHAR(100), @faculty CHAR(10);

DECLARE ScrollCursor CURSOR LOCAL SCROLL FOR
SELECT RowNum, SubjectName, Faculty FROM #TempSubjects
ORDER BY RowNum;

OPEN ScrollCursor;
PRINT '��������� �� ����������� ������� ���� � ������� SCROLL-�������:';

FETCH FIRST FROM ScrollCursor INTO @row_num, @scroll_subject, @faculty;
PRINT 'FIRST:     ' + CAST(@row_num AS VARCHAR) + ' - ' + @scroll_subject;

FETCH NEXT FROM ScrollCursor INTO @row_num, @scroll_subject, @faculty;
PRINT 'NEXT:      ' + CAST(@row_num AS VARCHAR) + ' - ' + @scroll_subject;

FETCH ABSOLUTE 3 FROM ScrollCursor INTO @row_num, @scroll_subject, @faculty;
PRINT 'ABSOLUTE 3:' + CAST(@row_num AS VARCHAR) + ' - ' + @scroll_subject;

FETCH RELATIVE 1 FROM ScrollCursor INTO @row_num, @scroll_subject, @faculty;
PRINT 'RELATIVE +1:' + CAST(@row_num AS VARCHAR) + ' - ' + @scroll_subject;

FETCH PRIOR FROM ScrollCursor INTO @row_num, @scroll_subject, @faculty;
PRINT 'PRIOR:     ' + CAST(@row_num AS VARCHAR) + ' - ' + @scroll_subject;

FETCH LAST FROM ScrollCursor INTO @row_num, @scroll_subject, @faculty;
PRINT 'LAST:      ' + CAST(@row_num AS VARCHAR) + ' - ' + @scroll_subject;

CLOSE ScrollCursor;
DEALLOCATE ScrollCursor;
DROP TABLE #TempSubjects;

------- 5. ������, ��������������� ���������� ����������� CURRENT OF
IF OBJECT_ID('tempdb..#TempProgress') IS NOT NULL DROP TABLE #TempProgress;

CREATE TABLE #TempProgress (
    StudentID INT,
    Subject CHAR(10),
    Note INT
);

INSERT INTO #TempProgress VALUES 
(1001, 'OAP', 5),
(1002, 'OAP', 3),
(1003, 'OAP', 4);

DECLARE @id INT, @mark INT;
DECLARE StudentCursor CURSOR FOR 
SELECT StudentID, Note FROM #TempProgress
FOR UPDATE;

OPEN StudentCursor;
FETCH NEXT FROM StudentCursor INTO @id, @mark;

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE #TempProgress SET Note = Note + 1 
    WHERE CURRENT OF StudentCursor;
    
    IF @mark < 4
        DELETE FROM #TempProgress WHERE CURRENT OF StudentCursor;
    
    FETCH NEXT FROM StudentCursor INTO @id, @mark;
END

CLOSE StudentCursor;
DEALLOCATE StudentCursor;

SELECT * FROM #TempProgress;
DROP TABLE #TempProgress;


------- 6.1 �������� ������� � ��������� � �������� ���� 4
DECLARE @count INT = (SELECT COUNT(*) FROM PROGRESS WHERE NOTE < 4);
PRINT '������� ' + CAST(@count AS VARCHAR) + ' ������� � �������� ���� 4';

DECLARE @idstudent6 INT, @subject6 CHAR(10), @note6 INT;
DECLARE BadGradesCursor CURSOR FOR 
    SELECT p.IDSTUDENT, p.SUBJECT, p.NOTE 
    FROM PROGRESS p
    JOIN STUDENT s ON p.IDSTUDENT = s.IDSTUDENT
    JOIN GROUPS g ON s.IDGROUP = g.IDGROUP
    WHERE p.NOTE < 5
    FOR UPDATE;

OPEN BadGradesCursor;
FETCH NEXT FROM BadGradesCursor INTO @idstudent6, @subject6, @note6;

IF @@FETCH_STATUS <> 0
    PRINT '��� ������� ��� ��������';
ELSE
BEGIN
    WHILE @@FETCH_STATUS = 0
    BEGIN
        DELETE FROM PROGRESS 
        WHERE CURRENT OF BadGradesCursor;
        
        PRINT '������� ������ ' + CAST(@note6 AS VARCHAR) + 
              ' �������� ' + CAST(@idstudent6 AS VARCHAR) + 
              ' �� �������� ' + @subject6;
        
        FETCH NEXT FROM BadGradesCursor INTO @idstudent6, @subject6, @note6;
    END
    PRINT '�������� ���������';
END

CLOSE BadGradesCursor;
DEALLOCATE BadGradesCursor;


--------- 6.2 ���������� ������ ����������� ��������
DECLARE @target_id INT = 1001;
SELECT IDSTUDENT, SUBJECT, NOTE 
    FROM PROGRESS 
-- ��������� ���������� ��� �������
DECLARE @idstudent6 INT;
DECLARE @subject6 CHAR(10);
DECLARE @note6 INT;

DECLARE UpdateGradeCursor CURSOR FOR 
    SELECT IDSTUDENT, SUBJECT, NOTE 
    FROM PROGRESS 
    WHERE IDSTUDENT = @target_id
    FOR UPDATE;

OPEN UpdateGradeCursor;
FETCH NEXT FROM UpdateGradeCursor INTO @idstudent6, @subject6, @note6;

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE PROGRESS 
    SET NOTE = NOTE - 1 
    WHERE CURRENT OF UpdateGradeCursor;
    
    PRINT '������� ' + CAST(@idstudent6 AS VARCHAR) + 
          ' �� �������� ' + @subject6 + 
          ': ������ �������� � ' + CAST(@note6 AS VARCHAR) + 
          ' �� ' + CAST(@note6 + 1 AS VARCHAR);
    
    FETCH NEXT FROM UpdateGradeCursor INTO @idstudent6, @subject6, @note6;
END

CLOSE UpdateGradeCursor;
DEALLOCATE UpdateGradeCursor;
