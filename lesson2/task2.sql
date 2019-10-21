-- Задача 02
/* Создайте базу данных example, разместите в ней таблицу users,
состоящую из двух столбцов, числового id и строкового name. */

create database example;
use example;
create table users (
	id INT UNSIGNED,
	name VARCHAR(100)
);
