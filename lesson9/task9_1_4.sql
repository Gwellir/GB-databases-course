-- Задача 9_1.4
/* (по желанию) Пусть имеется любая таблица с календарным полем created_at.
Создайте запрос, который удаляет устаревшие записи из таблицы,
оставляя только 5 самых свежих записей. */

USE test_base;

DROP TABLE IF EXISTS dates;
CREATE TABLE dates (
	id serial PRIMARY KEY,
	created_at date
);

INSERT INTO dates (created_at)
VALUES ('2018-08-01'),
('2018-08-04'),
('2018-08-16'),
('2018-08-14'),
('2018-08-15'),
('2018-08-17');

-- Выбор крайнего значения
SELECT @cutoff := created_at FROM dates ORDER BY created_at DESC LIMIT 5;
SELECT @cutoff;
delete FROM dates WHERE created_at < @cutoff;

-- Другой вариант, который правильно работает с повторяющимися датами
START TRANSACTION;
DROP TABLE IF EXISTS last_entries;
CREATE TEMPORARY TABLE last_entries (
	id serial,
	created_at date
);

INSERT INTO last_entries
(SELECT * FROM dates ORDER BY created_at DESC LIMIT 5);

DELETE FROM dates;

INSERT INTO dates (SELECT * FROM last_entries);

DROP TABLE IF EXISTS last_entries;
COMMIT;

-- Проверка
SELECT * FROM dates;
