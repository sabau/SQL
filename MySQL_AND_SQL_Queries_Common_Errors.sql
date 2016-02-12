# COUNTING
SELECT  a.id, COUNT(*)
FROM    a
LEFT JOIN
        b
ON      b.a = a.id
GROUP BY
        a.id
        
#CORRECT
SELECT  a.id, COUNT(b.a)
FROM    a
LEFT JOIN
        b
ON      b.a = a.id
GROUP BY
        a.id
    
        
# SAMPLING
SELECT  DISTINCT grouper
        FROM    a

#OR
SELECT  a.*
FROM    a
GROUP BY
        grouper
        
#CORRECT
SELECT  a.*
FROM    (
        SELECT  DISTINCT grouper
        FROM    a
        ) ao
JOIN    a
ON      a.id = 
        (
        SELECT  id
        FROM    a ai
        WHERE   ai.grouper = ao.grouper
        LIMIT 1
        )
        
        
# ORDERING
SELECT  *
FROM    a
ORDER BY
        RAND(), column
LIMIT 10

#CORRECT
SELECT  *
FROM    (
        SELECT  *
        FROM    mytable
        ORDER BY
                RAND()
        LIMIT 10
        ) q
ORDER BY
        column
        
        
#NOT IN WITH NULLS
SELECT  a.*
FROM    a
WHERE   a.column NOT IN
        (
        SELECT column
        FROM    b
        )
        
#CORRECT
SELECT  a.*
FROM    a
WHERE   NOT EXISTS
        (
        SELECT NULL
        FROM    b
        WHERE   b.column = a.column
        )
        

#JOINING ON NULL
SELECT  *
FROM    a
JOIN    b
ON      a.column = b.column

#CORRECT
SELECT  *
FROM    a
JOIN    b
ON      a.column = b.column
        OR (a.column IS NULL AND b.column IS NULL)
        
        
#NULL COMPARISON
SELECT  *
FROM    b
WHERE   b.column < 'something'
        AND b.column IS NOT NULL
        
#CORRECT (more elegant as null will always fai the filter)
SELECT  *
FROM    b
WHERE   b.column < 'something'


#LEFT JOIN WITH EXTRA CONDITIONS
SELECT  *
FROM    a
LEFT JOIN
        b
ON      b.a = a.id
WHERE   b.column = 'something'

#CORRECT more efficient
SELECT  *
FROM    a
LEFT JOIN
        b
ON      b.a = a.id
        AND b.column = 'something'
        
        
