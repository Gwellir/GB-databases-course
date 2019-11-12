-- Задание 7.3
/* (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
Поля from, to и label содержат английские названия городов, поле name — русское.
Выведите список рейсов flights с русскими названиями городов.
*/

-- Подготовка
USE test_base;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id serial PRIMARY KEY,
	`from` varchar(10),
	`to` varchar(10)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label varchar(10) PRIMARY KEY,
	name varchar(30)
);

INSERT INTO flights 
VALUES (NULL, 'LED', 'DME'),
(NULL, 'KGD', 'DME'),
(NULL, 'NRT', 'VVO');

INSERT INTO cities
VALUES ('LED', 'Санкт-Петербург, Пулково'),
('DME', 'Москва, Домодедово'),
('KGD', 'Калининград'),
('NRT', 'Токио, Нарита'),
('VVO', 'Владивосток');

-- Выборка
SELECT
  flights.id,
  (SELECT name FROM cities WHERE label = flights.`from`) AS departure,
  (SELECT name FROM cities WHERE label = flights.`to`) AS arrival
FROM flights;

-- Выборка без лишних SELECT
SELECT flights.id, c_from.name AS dept, c_to.name AS arrival
FROM 
  flights
JOIN cities c_from
  ON flights.`from` = c_from.label
JOIN cities c_to
  ON flights.`to` = c_to.label;
