
-- Урок 4 домашняя работа

-- Повторить все действия по доработке БД vk. - делаем
-- Заполнить новые таблицы. - делаем справочник стран, городов
-- Повторить все действия CRUD. - делаем вместе с п.1.

USE vk;
SHOW TABLES;
SELECT *
FROM users
LIMIT 10;
DESC users;
UPDATE users
SET updated_at = NOW()
WHERE updated_at < created_at;
SELECT *
FROM users
LIMIT 10;
DESC profiles;
SELECT *
FROM profiles
LIMIT 10;
UPDATE profiles
SET updated_at = NOW()
WHERE updated_at < created_at;
CREATE TEMPORARY TABLE genders
(
    name CHAR(1)
);
INSERT INTO genders VALUE ('M'), ('F');
SELECT *
FROM genders;
UPDATE profiles
SET gender = (SELECT name FROM genders ORDER BY RAND() LIMIT 1);
SELECT *
FROM profiles
LIMIT 10;

CREATE TABLE user_statuses
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
    name       VARCHAR(100) NOT NULL COMMENT "Название статуса (уникально)",
    created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
    updated_at DATETIME              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочник статусов";

INSERT INTO user_statuses (name)
VALUES ('single'),
       ('married');
SELECT *
FROM user_statuses;

UPDATE profiles
SET status = NULL;
ALTER TABLE profiles RENAME COLUMN status TO user_status_id;
ALTER TABLE profiles
    MODIFY COLUMN user_status_id INT UNSIGNED;
UPDATE profiles
SET user_status_id = (SELECT id FROM user_statuses ORDER BY RAND() LIMIT 1);

SHOW TABLES;

DESC messages;
ALTER TABLE messages
    ADD COLUMN media_id INT UNSIGNED AFTER body;

SELECT *
FROM messages
LIMIT 10;
UPDATE messages
SET from_user_id = FLOOR(1 + RAND() * 100),
    to_user_id   = FLOOR(1 + RAND() * 100);
UPDATE messages
SET updated_at = NOW()
WHERE updated_at < created_at;

DESC media;
SELECT *
FROM media
LIMIT 10;
UPDATE media
SET user_id = FLOOR(1 + RAND() * 100);

DROP TABLE IF EXISTS extension;
CREATE TEMPORARY TABLE extension
(
    name VARCHAR(10)
);
INSERT INTO extension
VALUES ('jpeg'),
       ('mpeg'),
       ('png');
SELECT *
FROM extension;

UPDATE media
SET filename = CONCAT(
        'http://dropbox.net/vk/',
        filename,
        '.',
        (SELECT name FROM extension ORDER BY RAND() LIMIT 1)
    );
UPDATE media
SET size = FLOOR(10000 + (RAND() * 1000000))
WHERE size < 1000;
UPDATE media
SET metadata = CONCAT('{"owner":"',
                      (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
                      '"}');
ALTER TABLE media
    MODIFY COLUMN metadata JSON;

SELECT *
FROM media_types;
DELETE
FROM media_types;
INSERT INTO media_types (name)
VALUES ('photo'),
       ('video'),
       ('audio');
TRUNCATE media_types;
UPDATE media
SET media_type_id = FLOOR(1 + RAND() * 3);

DESC friendship;
SELECT *
FROM friendship
LIMIT 10;
/*!40000 ALTER TABLE `friendship`
    DISABLE KEYS */;
UPDATE friendship
SET user_id   = FLOOR(1 + RAND() * 100),
    friend_id = FLOOR(1 + RAND() * 100);

UPDATE friendship
SET friend_id = friend_id + 1
WHERE user_id = friend_id;
/*!40000 ALTER TABLE `friendship`
    ENABLE KEYS */;

SELECT *
FROM friendship_statuses;
TRUNCATE friendship_statuses;

INSERT INTO friendship_statuses (name)
VALUES ('Requested'),
       ('Confirmed'),
       ('Rejected');

INSERT IGNORE INTO friendship_statuses (id, name)
VALUES (1, 'Requested'),
       (2, 'Confirmed'),
       (3, 'Rejected');

UPDATE friendship
SET status_id = FLOOR(1 + RAND() * 3);

DESC communities;
DELETE
FROM communities
WHERE id > 20;

SELECT *
FROM communities_users;
UPDATE communities_users
SET community_id = FLOOR(1 + RAND() * 20);
DELETE
FROM communities_users
WHERE community_id > 100;

CREATE TABLE friendship_statuses_new LIKE friendship_statuses;
SELECT *
FROM friendship_statuses_new;

CREATE TABLE friendship_statuses_new2 AS
SELECT *
FROM friendship_statuses;
SELECT *
FROM friendship_statuses_new2;

-- Таблица стран
CREATE TABLE country
(
    id         INT UNSIGNED        NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
    name       VARCHAR(100) UNIQUE NOT NULL COMMENT "Название статуса (уникально)",
    created_at DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
    updated_at DATETIME                     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочник стран";

INSERT INTO country (name)
VALUES ('Niger'),
       ('Abkhazia'),
       ('Australia'),
       ('Austria'),
       ('Haiti'),
       ('Gambia'),
       ('Ghana'),
       ('Mongolia'),
       ('Namibia'),
       ('Nepal');

-- Таблица городов
CREATE TABLE city
(
    id         INT UNSIGNED        NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
    name       VARCHAR(100) UNIQUE NOT NULL COMMENT "Название статуса (уникально)",
    created_at DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
    updated_at DATETIME                     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочник городов ";

INSERT INTO city (name)
VALUES ('Kawasaki'),
       ('Cairo'),
       ('Santiago de Cali'),
       ('Calcutta'),
       ('Cannes'),
       ('Kanpur'),
       ('Caracas'),
       ('Karaganda'),
       ('Karachi'),
       ('Karlovy Vary'),
       ('Lucknow'),
       ('Lanzhou'),
       ('Lahore'),
       ('Leipzig'),
       ('Liverpool'),
       ('Lima'),
       ('Limassol'),
       ('Lyons'),
       ('Lisbon');

-- обновляем профили в соответствии с таблицей стран и таблицей городов
UPDATE profiles
SET city = NULL;
ALTER TABLE profiles RENAME COLUMN city TO city_id;
ALTER TABLE profiles
    MODIFY COLUMN city_id INT UNSIGNED;
UPDATE profiles
SET city_id = (SELECT id FROM city ORDER BY RAND() LIMIT 1);

UPDATE profiles
SET country = NULL;
ALTER TABLE profiles RENAME COLUMN country TO country_id;
ALTER TABLE profiles
    MODIFY COLUMN country_id INT UNSIGNED;
UPDATE profiles
SET country_id = (SELECT id FROM country ORDER BY RAND() LIMIT 1);