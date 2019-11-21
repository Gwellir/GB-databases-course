-- Задача 9_3.2
/* В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
Допустимо присутствие обоих полей или одно из них.
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
При попытке присвоить полям NULL-значение необходимо отменить операцию.*/

USE shop;
DROP TRIGGER IF EXISTS check_null_insert;
DROP TRIGGER IF EXISTS check_null_update;

delimiter //
CREATE TRIGGER check_null_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN 
	IF (COALESCE(NEW.name, NEW.description) IS NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ни имя, ни описание товара в новой позиции не заданы!';
	END IF;
END//

CREATE TRIGGER check_null_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN 
	IF (COALESCE(NEW.name, NEW.description) IS NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ни имя, ни описание товара после обновления не заданы!';
	END IF;
END//

delimiter ;

-- insert подходящего значения
INSERT INTO products
VALUES (9, 'test', NULL, 123123,4, now(), now());

-- Проверка на insert двойного NULL
INSERT INTO products
VALUES (10, NULL, NULL, 123123,4, now(), now());

-- Проверка на подстановку второго NULL в существующую позицию
UPDATE products SET name = NULL WHERE id = 9;
