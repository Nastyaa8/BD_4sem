USE "4_MyBase"
SELECT 
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT = 'OAP') AS AVG_OAiP,
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT = 'DB') AS AVG_BD,
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT = 'KG') AS AVG_SUBD;
