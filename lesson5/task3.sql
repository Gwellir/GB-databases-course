-- Задача 03
/* В таблице складских запасов storehouses_products в поле value могут встречаться
самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы.
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения
значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей. */

-- Подготовка таблицы
CREATE DATABASE IF NOT EXISTS test_base;
USE test_base;
DROP TABLE IF EXISTS storehouse_products;
CREATE TABLE storehouse_products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	value BIGINT
);

INSERT INTO storehouse_products (name, value)
VALUES ('гвозди', 100000),
	('брёвна', 0),
	('болты', 34500),
	('доски', 500),
	('балки', 0);

-- Решение
SELECT * FROM storehouse_products ORDER BY value = 0, value;
