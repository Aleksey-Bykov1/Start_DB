/*
 2. Добавить необходимую таблицу/таблицы для того, чтобы можно было использовать лайки для медиафайлов,
 постов и пользователей.
 */

-- Media likes
CREATE TABLE likes
(
    id            INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
    whom_like_id  INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, кто поставил лайк",
    who_like_id   INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя, кому поставили лайк",
    status_likes  BOOLEAN COMMENT "Статус лайка",
    total_like_id INT          NOT NULL COMMENT "Ссылка на статус колличества лайков",
    media_id      INT UNSIGNED NOT NULL COMMENT "Ссылка на медиафайл которому поставили лайк",
    messages_id   INT UNSIGNED NOT NULL COMMENT "Ссылка на сообщение которому поставили лайк",
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
    updated_at    DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
    FOREIGN KEY (whom_like_id) REFERENCES users (id),
    FOREIGN KEY (who_like_id) REFERENCES users (id),
    FOREIGN KEY (media_id) REFERENCES media (id),
    FOREIGN KEY (messages_id) REFERENCES messages (id)
) COMMENT "Likes";
