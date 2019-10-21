-- Задача 3 (часть вторая)
/* Разверните содержимое дампа в новую базу данных sample */

create database sample;
use sample;
source example.sql;
show tables;
exit
