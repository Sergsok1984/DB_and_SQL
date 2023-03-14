-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT product_name, manufacturer, price FROM seminar1_table WHERE product_count > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT product_name, price, product_count FROM seminar1_table WHERE manufacturer = 'Samsung';

-- 4. С помощью регулярных выражений найти:
-- 4.1. Товары, в которых есть упоминание "Iphone"
      
SELECT product_name, price, product_count FROM seminar1_table WHERE product_name OR manufacturer LIKE '%Iphone%';
SELECT product_name, price, product_count FROM seminar1_table WHERE product_name OR manufacturer REGEXP 'Iphone';

-- 4.2. Товары в которых есть упоминание "Samsung"

SELECT product_name, price, product_count FROM seminar1_table WHERE product_name OR manufacturer LIKE '%Samsung%';
SELECT product_name, price, product_count FROM seminar1_table WHERE product_name OR manufacturer REGEXP 'Samsung';

-- 4.3. Товары, в названии которых есть ЦИФРЫ

SELECT product_name, price, product_count FROM seminar1_table WHERE product_name REGEXP '[^0-9]';

-- 4.34. Товары, в названии которых есть ЦИФРА "8"

SELECT product_name, price, product_count FROM seminar1_table WHERE product_name LIKE '%8%';
SELECT product_name, price, product_count FROM seminar1_table WHERE product_name REGEXP '8';
   