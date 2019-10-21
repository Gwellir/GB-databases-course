-- Задача 3 (часть вторая)
/* Разверните содержимое дампа в новую базу данных sample */

DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;
SOURCE example.sql;
SHOW TABLES;
