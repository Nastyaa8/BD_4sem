SELECT 
    [AT].AUDITORIUM_TYPENAME AS AuditoriumType,  
    A.AUDITORIUM_NAME AS Auditorium           
FROM 
    AUDITORIUM_TYPE AT
CROSS JOIN 
    AUDITORIUM A;