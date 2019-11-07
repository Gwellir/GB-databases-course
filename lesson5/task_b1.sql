-- Задание б.01
Подсчитайте средний возраст пользователей в таблице users

SELECT AVG(age) FROM users where age != 0 AND age IS NOT NULL;
