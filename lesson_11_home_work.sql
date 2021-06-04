-- Практическое задание по теме “Оптимизация запросов”
-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users,
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
-- идентификатор первичного ключа и содержимое поля name.

USE shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs
(
    created_at      DATETIME     NOT NULL,
    from_table      VARCHAR(30)  NOT NULL,
    from_table_id   INT          NOT NULL,
    from_table_name VARCHAR(255) NOT NULL
) COMMENT 'Table for logs of users, catalogs, products'
    ENGINE = ARCHIVE;

DROP TRIGGER IF EXISTS logs_for_users;
DELIMITER //
CREATE TRIGGER logs_for_user
    AFTER INSERT
    ON users
    FOR EACH ROW
BEGIN
    INSERT INTO logs(created_at, from_table, from_table_id, from_table_name)
        VALUE (NOW(), 'table_users', NEW.id, NEW.name);
end //

DROP TRIGGER IF EXISTS logs_for_catalogs;
CREATE TRIGGER logs_for_catalogs
    AFTER INSERT
    ON catalogs
    FOR EACH ROW
BEGIN
    INSERT INTO logs(created_at, from_table, from_table_id, from_table_name)
        VALUE (NOW(), 'table_catalogs', NEW.id, NEW.name);
end //

DROP TRIGGER IF EXISTS logs_for_products;
CREATE TRIGGER logs_for_products
    AFTER INSERT
    ON products
    FOR EACH ROW
BEGIN
    INSERT INTO logs(created_at, from_table, from_table_id, from_table_name)
        VALUE (NOW(), 'table_products', NEW.id, NEW.name);
end //

DELIMITER ;

-- Практическое задание по теме “NoSQL”
-- 1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

-- Заводим список ip адресов
LPUSH ip_address_pull 192.168.0.1 172.14.56.78 192.168.0.1 127.0.0.1 10.10.100.10 192.168.0.1

-- Узнаем длинну списка
LLEN ip_address_pull

-- Выводим все ip адреса для наглядности
LRANGE ip_address_pull 0 6

-- Вводим интересующий нас ip адрес и получаем колличество подключений
LPOS ip_address_pull 192.168.0.1 COUNT 0

-- 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу
-- и наоборот, поиск электронного адреса пользователя по его имени.

SET 001@inbox.ru user_1
SET user_1 001@inbox.ru

GET 001@inbox.ru
GET user_1

-- 3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.

use catalogs
db.catalogs.insertMany([{"name": "Процессоры"}, {"name": "Материнские платы"}, {"name": "Видеокарты"}])
{
	"acknowledged" : true,
	"insertedIds" : [
		ObjectId("60b9f3af6ed54511e67589cd"),
		ObjectId("60b9f3af6ed54511e67589ce"),
		ObjectId("60b9f3af6ed54511e67589cf")
	]
}

use products
db.products.insertMany([
    {"name": "Nvidia", "description": "Vidio card", "price": "2800.00", "catalog_id": "Видеокарты", "created_at": new Date(), "updated_at": new Date()},
    {"name": "Intel", "description": "Mega Proc", "price": "3000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}])
{
	"acknowledged" : true,
	"insertedIds" : [
		ObjectId("60b9f62b6ed54511e67589d0"),
		ObjectId("60b9f62b6ed54511e67589d1")
	]
}

