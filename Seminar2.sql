-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date VARCHAR(20),
    count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES
('10-03-2023', 15),
('11-03-2023', 117),
('12-03-2023', 228),
('13-03-2023', 560),
('14-03-2023', 420);

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT id, order_date, count_product,
CASE
	WHEN count_product < 100
		THEN 'Маленький заказ'
	WHEN count_product BETWEEN 100 AND 300 
		THEN 'Средний заказ'
	WHEN count_product > 300
		THEN 'Большой заказ'
END 
AS 'order_type'
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(20),
    amount VARCHAR(20),
    order_status VARCHAR(20)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e01', '10', 'OPEN'),
('e02', '15', 'OPEN'),
('e03', '100', 'CLOSED'),
('e04', '25', 'OPEN'),
('e05', '8', 'CANCELLED');


SELECT *,
CASE
	WHEN order_status = 'OPEN'
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED'
		THEN 'Order is closed'
	WHEN order_status = 'CANCELLED'
		THEN 'Order is cancelled'
END 
AS 'full_order_status'
FROM orders;

/* 4. Чем NULL отличается от 0?
NULL = отсутствие значения, "пустое поле"
0 = значение, константа
**/