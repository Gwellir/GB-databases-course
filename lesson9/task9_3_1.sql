-- Задача 9_3.1
/* Создайте хранимую функцию hello(), которая будет возвращать приветствие,
в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи". */

DROP FUNCTION IF EXISTS hello;
delimiter //

CREATE FUNCTION hello ()
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
	DECLARE hrs int;
	SET hrs = HOUR(now());
	IF (hrs < 6) THEN
		RETURN 'Доброй ночи!';
	ELSEIF (hrs < 12) THEN
		RETURN 'Доброе утро!';
	ELSEIF (hrs < 18) THEN 
		RETURN 'Добрый день!';
	ELSE
		RETURN 'Добрый вечер!';
	END IF;
END//

delimiter ;

SELECT hello();
