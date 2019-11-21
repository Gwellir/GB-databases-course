-- Задача 9_1.1
/* Создайте представление, которое выводит название name товарной позиции из таблицы products
 * и соответствующее название каталога name из таблицы catalogs. */

USE shop;

CREATE OR REPLACE VIEW names AS
SELECT products.name AS `Продукт`, catalogs.name AS `Раздел`
FROM products LEFT JOIN catalogs
ON catalogs.id = products.catalog_id;

SELECT * FROM names;
