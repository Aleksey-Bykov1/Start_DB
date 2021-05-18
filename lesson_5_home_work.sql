-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными.
--    Заполните их текущими датой и временем.

USE shop;

UPDATE users
SET updated_at = NOW(),
    created_at = NOW();

-- 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at
--    были заданы типом VARCHAR  и в них долгое время помещались значения в формате 20.10.2017 8:10.
--    Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

ALTER TABLE users MODIFY COLUMN created_at DATETIME;
ALTER TABLE users MODIFY COLUMN updated_at DATETIME;

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0,
--    если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким
--    образом, чтобы они выводились в порядке увеличения значения value.
--    Однако нулевые запасы должны выводиться в конце, после всех записей.

--    Заполнил пустую таблицу значениями

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,1,1,3,'2008-04-21 20:13:33','1984-06-29 19:26:48'),(2,2,2,7,'1990-11-04 01:02:10','2012-10-28 10:03:45'),(3,3,3,4,'1985-12-26 11:29:11','1972-07-23 04:39:26'),(4,4,4,2,'1981-12-28 22:15:57','2002-08-08 14:14:27'),(5,5,5,4,'2020-08-14 12:49:58','2018-07-08 18:19:16'),(6,6,6,9,'2013-09-06 16:08:06','1979-08-06 08:54:19'),(7,7,7,5,'1977-09-10 03:15:29','2009-03-25 14:06:42'),(8,8,1,7,'2003-11-27 23:40:55','1990-08-26 21:31:01'),(9,9,2,1,'1978-09-03 20:09:52','1979-11-18 21:47:53'),(10,10,3,8,'1983-08-19 20:02:45','2014-01-12 17:31:29'),(11,1,4,7,'1998-10-09 12:12:03','2015-09-12 15:37:02'),(12,2,5,0,'2007-03-17 18:04:39','2005-01-24 22:45:24'),(13,3,6,4,'1978-09-29 10:45:51','1998-12-08 00:21:48'),(14,4,7,9,'1981-07-23 05:25:40','1996-05-18 03:50:31'),(15,5,1,8,'1984-06-03 12:40:56','1993-08-23 15:49:32'),(16,6,2,0,'1976-11-12 07:17:59','1985-01-14 17:47:34'),(17,7,3,5,'2012-10-20 23:34:12','2005-07-05 18:14:25'),(18,8,4,5,'1979-11-25 04:55:27','1978-08-17 08:10:06'),(19,9,5,2,'2019-03-18 12:22:08','1996-05-24 03:36:54'),(20,10,6,8,'2003-01-24 23:11:25','1979-08-23 15:41:46');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

-- сортировка данных согласно условия

SELECT value
FROM storehouses_products
ORDER BY value = 0 ASC, value ASC;

-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
-- Месяцы заданы в виде списка английских названий (may, august)

SELECT name,
       birthday_at,
       CASE
           WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'may'
           WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'august'
           END AS mounth
FROM users
WHERE DATE_FORMAT(birthday_at, '%m') = 05
   OR DATE_FORMAT(birthday_at, '%m') = 08;

-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT *
FROM catalogs
WHERE id IN (5, 1, 2)
ORDER BY FIELD(id, 5, 1, 2);

-- Практическое задание теме «Агрегация данных»
-- Подсчитайте средний возраст пользователей в таблице users.

SELECT ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25), 0) AS Average_age
FROM users;

-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day,
       COUNT(*)                                                         AS total_birthday
FROM users
GROUP BY week_day
ORDER BY total_birthday;

-- (по желанию) Подсчитайте произведение чисел в столбце таблицы.

CREATE TABLE numbers
(
    number SERIAL PRIMARY KEY
);

INSERT INTO numbers
VALUES (1),
       (2),
       (3),
       (4),
       (5);

SELECT *
FROM numbers;

SELECT ROUND(exp(SUM(log(number))), 0) AS result
FROM numbers;
