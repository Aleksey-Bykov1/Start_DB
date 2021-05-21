-- 1. Проанализировать запросы, которые выполнялись на занятии,
--    определить возможные корректировки и/или улучшения (JOIN пока не применять).

--  Запросы выполненные на уроке проанализировал, выполнил в рамках закрепления материала.
/*      Предложения следущие:
        В запросе где мы выбираем только друзей с активным статусом есть нюанс,
    при таком формировании запроса выберуться друзья у которых или
    сам users_id = 9 и status_id = 2, или другой пользователь у которого
    user_id = 9 добавлен в друзья и status_id = 2.
        НО тогда у пользователя user_id = 9 может не быть второго пользователя в списке друзей.
    Так как UNION добавляет еще одно условие по которому пройдет отбор и может пройти либо по
    первому условию либо по вторму.

        Предлагаю поставить AND вместо UNION и тогда будет четко выполнятся условие что пользователи
    в списке друзей и с подтвержденным статусом.
 */
-- Пример запроса с AND вместо UNION.

SELECT friend_id
FROM friendships
WHERE user_id = 9
  AND status_id = 2
  AND friend_id IN (SELECT user_id
                    FROM friendships
                    WHERE friend_id = 9
                      AND status_id = 2);

-- 2. Пусть задан некоторый пользователь.
--    Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT (SELECT CONCAT(first_name, ' ', last_name)
        FROM vk.users
        WHERE id = messages.from_user_id) best_friend,
       COUNT(*)                           total_messages
FROM vk.messages
WHERE from_user_id IN
      (SELECT friend_id
       FROM friendships
       WHERE user_id = 9
         AND status_id = 2
         AND friend_id IN (SELECT user_id
                           FROM friendships
                           WHERE friend_id = 9
                             AND status_id = 2))
GROUP BY from_user_id
ORDER BY total_messages
DESC
lIMIT 1;

-- 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

SELECT target_id,
       COUNT(*)      total_likes,
       (SELECT birthday
        FROM vk.profiles
        WHERE profiles.user_id = likes.target_id
        ) AS birth
FROM vk.likes
WHERE target_type_id = 2
GROUP BY target_id
ORDER BY birth DESC
LIMIT 10;

-- 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT COUNT(user_id) AS total_likes_femens,
(SELECT COUNT(user_id)
    FROM vk.likes
WHERE user_id =(
    SELECT user_id
    FROM vk.profiles
    WHERE likes.user_id = profiles.user_id
    AND gender = 'm')) AS total_likes_mens
FROM vk.likes
WHERE user_id =(
    SELECT user_id
    FROM vk.profiles
    WHERE likes.user_id = profiles.user_id
    AND gender = 'f');

-- 5. Найти 10 пользователей, которые проявляют наименьшую
--    активность в использовании социальной сети.

SELECT id,
       first_name,
       last_name,
       (SELECT COUNT(user_id)
           FROM vk.likes
           WHERE user_id = users.id) AS total_likes,
       (SELECT COUNT(from_user_id)
           FROM vk.messages
           WHERE from_user_id = users.id) AS total_messages,
       (SELECT COUNT(user_id)
           FROM vk.posts
           WHERE user_id = users.id) AS total_posts
FROM vk.users
ORDER BY total_likes, total_messages, total_posts
LIMIT 10;
