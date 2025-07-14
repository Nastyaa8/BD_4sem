DECLARE @totalCapacity INT;
DECLARE @averageCapacity FLOAT;
DECLARE @countBelowAverage INT;
USE [4_MyBase]
DECLARE @percentageBelowAverage FLOAT;

SELECT 
    @totalCapacity = SUM(AUDITORIUM_CAPACITY),   
    @averageCapacity = AVG(AUDITORIUM_CAPACITY)  
FROM AUDITORIUM;


IF @totalCapacity > 200
BEGIN
    
    SELECT 
        @countBelowAverage = COUNT(*) 
    FROM AUDITORIUM
    WHERE AUDITORIUM_CAPACITY < @averageCapacity;

    
    SELECT 
        @percentageBelowAverage = (CAST(@countBelowAverage AS FLOAT) / COUNT(*) * 100) 
    FROM AUDITORIUM;

    
    SELECT 
        @totalCapacity AS �����_�����������,
        @averageCapacity AS �������_�����������,
        @countBelowAverage AS ����������_���������_������_�������,
        @percentageBelowAverage AS �������_���������_������_�������;
END

