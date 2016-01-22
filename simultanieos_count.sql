SET @start := '2015-12-12 00:00:00', @end := '2015-12-12 23:59:59';
SELECT MAX(simultaneous_people), boundary
FROM (
       SELECT COUNT(DISTINCT CallID) AS simultaneous_people, boundary
       FROM   mytable RIGHT JOIN (
                                    SELECT row_begin AS boundary
                                    FROM   mytable
                                    WHERE  row_begin BETWEEN @start AND @end
                                    UNION
                                    SELECT row_end
                                    FROM   mytable
                                    WHERE  row_end BETWEEN @start AND @end
                                    UNION SELECT @start UNION SELECT @end
                                    UNION
                                    SELECT MAX(boundary)
                                    FROM (
                                           SELECT MAX(row_begin) AS boundary
                                           FROM   mytable
                                           WHERE  row_begin <= @start
                                           UNION ALL
                                           SELECT MAX(row_end)
                                           FROM   mytable
                                           WHERE  row_end <= @end
                                         ) t
                                  ) t ON row_begin <= boundary AND boundary < row_end
         WHERE row_info IN ('acceptable', 'correct')
       GROUP BY boundary
     ) t;
