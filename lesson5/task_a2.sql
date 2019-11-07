-- Задача а.02
/* Таблица users была неудачно спроектирована. Записи created_at и updated_at
были заданы типом VARCHAR и в них долгое время помещались значения в формате
"20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME,
сохранив введеные ранее значения. */

-- Подготовка таблицы
CREATE DATABASE IF NOT EXISTS test_base;
USE test_base;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	created_at VARCHAR(20),
	updated_at VARCHAR(20)
);

INSERT INTO users (name, created_at, updated_at)
VALUES ('Ivan', '20.10.2012 8:10', '22.05.2015 18:10'),
		   ('Peter', '10.01.2016 9:56', '04.03.2018 22:06');

-- Преобразование данных
UPDATE users
SET created_at = 
	CONVERT(concat_ws(' ', concat_ws('-', substring(created_at, 7, 4),
		substring(created_at, 4, 2), substring(created_at, 1, 2)),
		concat(substring(created_at, 12), ':00')), datetime),
	updated_at = 
	CONVERT(concat_ws(' ', concat_ws('-', substring(updated_at, 7, 4),
		substring(updated_at, 4, 2), substring(updated_at, 1, 2)),
		concat(substring(updated_at, 12), ':00')), datetime);
    
-- Модификация типов полей
ALTER TABLE users
MODIFY COLUMN updated_at datetime;
ALTER TABLE users
MODIFY COLUMN created_at datetime;

SELECT * FROM users;
