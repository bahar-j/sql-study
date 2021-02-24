--https://programmers.co.kr/learn/courses/30/lessons/59405?language=oracle

--풀이 1(mysql)
/* SELECT NAME 
    FROM ANIMAL_INS
    ORDER BY DATETIME LIMIT 1; */

--풀이 2(oracle)
SELECT NAME
    FROM (SELECT * FROM ANIMAL_INS
    ORDER BY DATETIME)
    WHERE ROWNUM = 1;