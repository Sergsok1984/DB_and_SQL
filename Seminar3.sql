-- Задание №1.

CREATE TABLE orders (
  id int PRIMARY KEY AUTO_INCREMENT,  
  orderPrice int NOT NULL,
  dataOrder date NOT NULL,
  customerName varchar (30) NOT NULL,
  city varchar (40)
  );

-- 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
SELECT dataOrder, SUM(orderPrice) as sumSales
FROM orders
WHERE dataOrder = '2016-01-01';

-- 2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.
SELECT city, COUNT(DISTINCT city) as nnull
FROM orders
WHERE NOT (city is NULL)
GROUP BY city;;

-- 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
SELECT MIN(orderPrice) as min, customerName
FROM orders
GROUP BY customerName;

-- 4*. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г. Используется оператор "LIKE"
SELECT customerName
FROM orders
WHERE customerName LIKE 'Г%'
ORDER BY customerName;

-- 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.
SELECT city, COUNT(city) AS rating
FROM orders
GROUP BY city
HAVING rating > 0;

-- Задание №2.

CREATE TABLE users (
id INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(30) NOT NULL,
Surname VARCHAR(30) NOT NULL,
Specialty VARCHAR(30) NOT NULL,
Seniority INT NOT NULL,
Salary INT NOT NULL,
Age INT NOT NULL
);

INSERT INTO users (
Name, Surname , Specialty , Seniority , Salary , Age 
)

VALUES
('Vasya','Petrov','Chief', 40, 100000, 60),
('Petr','Ivanov','Chief', 8, 70000, 50),
('Kate','Sidorova','Ingener', 2, 70000, 25),
('Alex','Pupkin','Ingener', 12, 50000, 35),
('Ivan','Ivanov','Worker', 20, 40000, 28),
('Anton','Kovenski','Worker', 8, 19000, 25),
('Maksim','Voronin','Worker', 8, 23000, 32),
('Lusya','Luskina','Cleaner', 10, 10000, 49);

-- 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания.

SELECT *
FROM users
ORDER BY Salary;

SELECT *
FROM users
ORDER BY Salary desc;

-- 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой.

SELECT id, Name, Surname, Specialty, Salary
FROM users
ORDER BY Salary DESC
LIMIT 5;

-- 3. Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000.

SELECT id, Name, Surname, Specialty, Salary
FROM users
WHERE Specialty = "Worker" 
AND Salary >= 20000;
