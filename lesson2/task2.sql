-- Задача 02
/* Создайте базу данных example, разместите в ней таблицу users,
состоящую из двух столбцов, числового id и строкового name. */

DROP DATABASE IF EXISTS example;
CREATE DATEBASE example;
USE example;
CREATE TABLE users (
	id INT UNSIGNED,
	name VARCHAR(100)
);
SHOW TABLES;
