SELECT CAST(CONCAT( a.a, ':', c.a, d.a ) AS TIME )  AS _minute
FROM (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9
     UNION all select 10 as a union all select 11 union all select 12 union all select 13 union all select 14 union all select 15 union all select 16 union all select 17 union all select 18 union all select 19
     UNION all select 20 as a union all select 21 union all select 22 union all select 23
    ) AS a
 CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 ) as c
 CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as d;
