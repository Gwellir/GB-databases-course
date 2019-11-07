-- Задача б.02
/* Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения. */

SELECT DAYNAME(ADDDATE(created_at, INTERVAL (YEAR(curdate()) - YEAR(created_at)) YEAR)) AS week_day,
	count(DAYNAME(ADDDATE(created_at, INTERVAL (YEAR(curdate()) - YEAR(created_at)) YEAR))) FROM users
	GROUP BY DAYNAME(ADDDATE(created_at, INTERVAL (YEAR(curdate()) - YEAR(created_at)) YEAR))
	ORDER BY field(week_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'); 
