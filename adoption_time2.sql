-- https://programmers.co.kr/learn/courses/30/lessons/59413
-- Oracle에서는 뷰에 alias 붙일 때 as 붙이면 안됨!!

SELECT A.HOUR, NVL(b.count, a.count) AS count
    from (SELECT LEVEL-1 AS hour, 0 AS count
            FROM dual
            CONNECT BY LEVEL<25) a,
    (SELECT to_char(datetime, 'hh24') AS hour, count(*) AS count
        FROM animal_outs
        GROUP BY to_char(datetime, 'hh24')
        ORDER BY to_char(datetime, 'hh24')) b
    WHERE a.hour = b.hour(+)
    ORDER BY a.hour;