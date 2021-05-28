-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
--    Наполняем таблицы users, orders, orders_products.
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя покупателя',
    `birthday_at` date                                    DEFAULT NULL COMMENT 'Дата рождения',
    `created_at`  datetime                                DEFAULT current_timestamp(),
    `updated_at`  datetime                                DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='Покупатели';

INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('1', 'Vasia', '1986-10-29', '1993-09-21 17:15:59', '2021-02-08 08:06:15');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('2', 'Petia', '2013-12-26', '2014-03-25 19:26:29', '1978-09-17 10:55:02');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('3', 'Pasha', '2004-07-09', '2015-01-30 06:07:21', '1991-04-24 17:55:07');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('4', 'Olia', '1980-04-14', '2001-10-26 07:07:02', '1981-01-09 08:52:59');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('5', 'Tania', '1988-04-27', '2016-04-09 17:33:33', '2007-03-31 11:29:35');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('6', 'Vagan', '2017-11-16', '1998-05-17 06:23:39', '1974-03-30 20:18:51');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('7', 'Dmitriy', '2021-01-28', '2020-07-28 11:24:10', '1991-06-29 02:48:08');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('8', 'Ksenia', '1994-11-10', '2007-02-03 19:48:31', '1993-11-15 11:56:39');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('9', 'Timofey', '2000-07-21', '2015-12-10 19:03:19', '1996-12-12 06:13:40');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('10', 'Vladimir', '2006-06-02', '2006-09-11 02:12:43', '1997-05-02 08:04:46');

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders`
(
    `id`         bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `user_id`    int(10) unsigned DEFAULT NULL,
    `created_at` datetime         DEFAULT current_timestamp(),
    `updated_at` datetime         DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`),
    KEY `index_of_user_id` (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='Заказы';

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('1', 1, '1979-05-21 07:10:05', '1995-07-31 11:00:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('2', 2, '2014-01-17 22:50:46', '1977-06-20 12:02:11');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('3', 3, '2008-08-31 16:31:51', '1988-03-12 07:03:32');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('4', 4, '1989-08-30 19:21:42', '1971-06-29 17:24:36');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('5', 5, '2019-06-25 02:56:42', '2006-01-17 21:54:50');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('6', 6, '1978-07-26 15:43:20', '1976-05-29 17:39:21');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('7', 1, '2007-09-26 12:08:48', '1984-09-10 10:47:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('8', 2, '2016-07-06 07:26:27', '1987-11-18 15:53:32');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('9', 3, '1991-01-09 15:27:08', '1986-10-08 03:14:13');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES ('10', 4, '1998-09-24 16:49:29', '2020-07-05 22:41:54');

DROP TABLE IF EXISTS `orders_products`;

CREATE TABLE `orders_products`
(
    `id`         bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `order_id`   int(10) unsigned DEFAULT NULL,
    `product_id` int(10) unsigned DEFAULT NULL,
    `total`      int(10) unsigned DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
    `created_at` datetime         DEFAULT current_timestamp(),
    `updated_at` datetime         DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='Состав заказа';

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('1', 1, 1, 1, '2007-02-28 14:47:33', '2001-10-24 10:12:58');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('2', 2, 2, 1, '1981-09-22 12:56:46', '2013-09-05 17:05:18');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('3', 3, 3, 1, '2017-06-27 15:51:41', '2006-01-06 00:52:33');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('4', 4, 4, 1, '1998-05-06 11:43:32', '2014-05-29 14:28:13');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('5', 5, 5, 1, '2017-09-16 02:28:19', '1991-05-22 17:05:00');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('6', 6, 6, 1, '1974-04-03 10:11:40', '2001-12-17 23:42:46');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('7', 7, 7, 1, '1998-01-04 06:42:04', '1993-05-31 21:43:05');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('8', 8, 1, 1, '2020-07-11 13:07:36', '1984-08-04 12:21:28');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('9', 9, 2, 1, '1997-03-27 21:31:22', '1983-07-29 16:08:33');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`)
VALUES ('10', 10, 3, 1, '1973-03-29 09:04:14', '1991-10-15 23:14:27');

-- Теперь делаем выборку заказов пользователей

SELECT name,
       (SELECT name FROM products WHERE id = orders_products.product_id) AS 'product',
       total
FROM users
         RIGHT JOIN orders
                    ON users.id = orders.user_id
         RIGHT JOIN orders_products
                    ON orders.id = orders_products.id;

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT c.name,
       products.name
FROM products
         JOIN catalogs c on c.id = products.catalog_id;

-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.

-- Создаем таблицы

CREATE DATABASE air;
USE air;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights
(
    id     SERIAL PRIMARY KEY,
    `from` VARCHAR(255) NOT NULL COMMENT 'откуда вылет',
    `to`   VARCHAR(255) NOT NULL COMMENT 'куда вылет'
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities
(
    label VARCHAR(255) PRIMARY KEY COMMENT 'название города по английски',
    name  VARCHAR(255) COMMENT 'название города по русски'
);

INSERT INTO flights VALUE
    (NULL, 'Moscow', 'Omsk'),
    (NULL, 'Novgorod', 'Kazan'),
    (NULL, 'Irkutsk', 'Moscow'),
    (NULL, 'Omsk', 'Irkutsk'),
    (NULL, 'Moscow', 'Kazan');

INSERT INTO cities
VALUES ('Moscow', 'Москва'),
       ('Irkutsk', 'Иркутск'),
       ('Novgorod', 'Новгород'),
       ('Kazan', 'Казань'),
       ('Omsk', 'Омск');

-- Формируем запрос

SELECT id,
       (SELECT name FROM cities WHERE label = `from`) AS `from`,
       (SELECT name FROM cities WHERE label = `to`)   AS `to`
FROM flights
ORDER BY id;
