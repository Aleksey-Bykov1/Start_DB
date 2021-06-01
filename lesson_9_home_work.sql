
/*
 Практическое задание по теме “Транзакции, переменные, представления”
 */
-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;

USE sample;

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) COMMENT 'Имя покупателя',
    birthday_at DATE COMMENT 'Дата рождения',
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at  DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

START TRANSACTION;
INSERT INTO sample.users
SELECT *
FROM shop.users
WHERE id = 1;
DELETE shop.users
FROM shop.users
WHERE id = 1;
COMMIT;
SELECT *
FROM users;
SELECT *
FROM shop.users;

-- 2. Создайте представление, которое выводит название name товарной позиции из
-- таблицы products и соответствующее название каталога name из таблицы catalogs.

CREATE OR REPLACE VIEW prod_cat_name(id, name, catalog) AS
SELECT p.id AS id, p.name, c.name
FROM products AS p
         LEFT JOIN catalogs AS c
                   ON p.catalog_id = c.id;

   /*
    Практическое задание по теме “Администрирование MySQL”
    */
-- 1. Создайте двух пользователей которые имеют доступ к базе данных shop.
-- Первому пользователю shop_read должны быть доступны только запросы на
-- чтение данных, второму пользователю shop — любые операции в пределах базы
-- данных shop.

DROP USER IF EXISTS 'shop_reader'@'%';
CREATE USER 'shop_reader'@'%' IDENTIFIED WITH sha256_password BY 'P@ssW0rd';
GRANT SELECT ON shop.* TO 'shop_reader'@'%';

DROP USER IF EXISTS 'shop'@'%';
CREATE USER 'shop'@'%' IDENTIFIED  WITH  sha256_password BY 'Qq@1234567';
GRANT ALL ON shop.* TO 'shop'@'%';
GRANT GRANT OPTION ON shop.* TO 'shop'@'%';

-- 2. (по желанию) Пусть имеется таблица accounts содержащая три столбца id,
-- name, password, содержащие первичный ключ, имя пользователя и его пароль.
-- Создайте представление username таблицы accounts, предоставляющий доступ
-- к столбца id и name. Создайте пользователя user_read, который бы не имел
-- доступа к таблице accounts, однако, мог бы извлекать записи из представления username.

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts
(
    id       SERIAL PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(255) NOT NULL,
    password VARCHAR(255)
);

CREATE OR REPLACE VIEW username (user_id, user_name) AS
SELECT id, name
FROM accounts;

DROP USER IF EXISTS user_read;
CREATE USER 'user_read'@'localhost' IDENTIFIED WITH sha256_password BY '1@aSLA22a';
GRANT SELECT ON shop.username TO 'user_read'@'localhost';

    /*
    Практическое задание по теме “Хранимые процедуры и функции, триггеры"
      */
--  1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
--  С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00
--  функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello()
    RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    SET @time = CURTIME();
    CASE
        WHEN @time BETWEEN '06:00:00' AND '12:00:00' THEN
            RETURN 'Доброе утро';
        WHEN @time BETWEEN '12:00:00' AND '18:00:00' THEN
            RETURN 'Добрый день';
        WHEN @time BETWEEN '18:00:00' AND '00:00:00' THEN
            RETURN 'Добрый вечер';
        ELSE
            RETURN 'Доброй ночи';
        END CASE;
end //
DELIMITER ;

SELECT hello();

-- 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное
-- значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были
-- заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.

DROP TRIGGER IF EXISTS not_null_trigger;
DELIMITER $$
CREATE TRIGGER not_null_trigger
    BEFORE INSERT
    ON products
    FOR EACH ROW
BEGIN
    IF (ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Поля name и description не должны быть пустыми.
                                Заполните хотябы одно из полей.';
    end if;
end $$
DELIMITER ;

