--https://programmers.co.kr/learn/courses/30/lessons/59044

--mysql
/*
SELECT I.NAME, I.DATETIME 
    FROM ANIMAL_INS I
    LEFT JOIN ANIMAL_OUTS O 
    ON I.ANIMAL_ID=O.ANIMAL_ID
    WHERE O.ANIMAL_ID IS NULL 
    ORDER BY I.DATETIME LIMIT 3;
*/


--oracle
SELECT *
    from (select i.name, i.datetime
            from animal_ins i, animal_outs o
            where i.animal_id = o.animal_id(+)
            and o.animal_id is null
            order by i.datetime)
    where rownum <= 3;