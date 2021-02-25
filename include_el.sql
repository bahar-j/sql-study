-- https://programmers.co.kr/learn/courses/30/lessons/59047
SELECT animal_id, name
    from animal_ins
    where animal_type = 'Dog'
    and (upper(name) like '%EL%')
    order by name;