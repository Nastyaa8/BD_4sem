SELECT 
    B.ID, 
    B.Description
FROM Table_A A
FULL OUTER JOIN Table_B B ON A.ID = B.ID
WHERE A.ID IS NULL;