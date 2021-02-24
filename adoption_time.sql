-- https://programmers.co.kr/learn/courses/30/lessons/59412

select to_char(datetime, 'hh24') as hour, count(*) as count
    from animal_outs
    where to_char(datetime, 'hh24') between 9 and 19
    group by to_char(datetime, 'hh24')
    order by to_char(datetime, 'hh24');