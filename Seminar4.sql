-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA.

SELECT mark, color, COUNT(color) 
FROM auto
WHERE mark IN ('BMW', 'LADA')
GROUP BY color, mark
ORDER BY mark;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки.

SELECT DISTINCT mark, 
((SELECT COUNT(mark) FROM auto) - COUNT(mark)) AS another_auto
FROM auto
GROUP BY mark;

-- 3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT * FROM test_a
LEFT JOIN test_b ON test_b.id = test_a.id
WHERE test_b.id IS NULL;