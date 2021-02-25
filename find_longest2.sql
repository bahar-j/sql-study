-- https://programmers.co.kr/learn/courses/30/lessons/59411
SELECT *
    from (select i.animal_id, i.name
            from animal_ins i, animal_outs o
            where i.animal_id(+) = o.animal_id
            and i.animal_id is not null
            order by o.datetime - i.datetime desc)
    where rownum <= 2;