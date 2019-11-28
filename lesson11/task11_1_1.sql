-- Задание 11_1.1
/* Создайте таблицу logs типа Archive. Пусть при каждом создании записи
* в таблицах users, catalogs и products в таблицу logs помещается
* время и дата создания записи, название таблицы,
* идентификатор первичного ключа и содержимое поля name. */

USE shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at datetime DEFAULT now(),
	table_name varchar(255) NOT NULL,
	external_id BIGINT(20) UNSIGNED,
	entry_name varchar(255) NOT NULL
) ENGINE=Archive;

delimiter //

CREATE TRIGGER on_users_insert AFTER INSERT ON users
FOR EACH ROW
BEGIN 
	INSERT INTO logs (table_name, external_id, entry_name)
	VALUES ('users', NEW.id, NEW.name);
END//

CREATE TRIGGER on_products_insert AFTER INSERT ON products
FOR EACH ROW
BEGIN 
	INSERT INTO logs (table_name, external_id, entry_name)
	VALUES ('products', NEW.id, NEW.name);
END//

CREATE TRIGGER on_catalogs_insert AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN 
	INSERT INTO logs (table_name, external_id, entry_name)
	VALUES ('catalogs', NEW.id, NEW.name);
END//

delimiter ;

INSERT INTO users (name, birthday_at)
VALUES ('Васисуалий', '2004-03-23');

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Intel S1200SPLR', 'Материнская плата Intel S1200SPLR, Intel C236, Socket 1151, DDR4, mATX', 14550, 2);

INSERT INTO catalogs (name)
VALUES ('Блоки питания');

SELECT * FROM logs;
