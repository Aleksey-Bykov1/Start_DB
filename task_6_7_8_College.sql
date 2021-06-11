-- 6. Cкрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);

-- Посчитать сколько и каких экземпляров книг нужно заказать поставщикам,
-- чтобы на складе стало одинаковое количество экземпляров каждой книги,
-- равное значению самого большего количества экземпляров одной книги на складе.

SELECT title,
       author,
       amount,
       ((SELECT MAX(amount) FROM library) - amount) AS to_order
FROM library
WHERE amount NOT IN(SELECT MAX(amount) FROM library) ;

-- Вывести имя и фамилию, электронную почту, название факультета тех студентов у которых почта
-- на yandex "ya", отсортироваь по факультету.

SELECT CONCAT(first_name, ' ', last_name) AS fulname,
       email,
       (SELECT faculty_name FROM faculty WHERE faculty_id = faculty) AS faculty
FROM students
WHERE email RLIKE '^*@ya.*$'
ORDER BY faculty;

-- Вывести максимальное и минимальное колличество книг каждого автора, кроме Т.Л.Стасышина,
-- количество экземпляров книг которого больше 10.

SELECT author,
    MIN(amount) AS Min_amount,
    MAX(amount) AS Max_amount
FROM library
WHERE author <> 'Т.Л.Стасышина'
GROUP BY author
HAVING SUM(amount) > 10;

-- Вывести всех студентов у которых оцена за экзамен "4".

SELECT CONCAT(students.first_name, ' ', students.last_name) AS fulname,
       exam_mark.mark
FROM students
    JOIN exam_mark
ON student_id = exam_mark.student
WHERE exam_mark.mark = 4;

-- Вывести студентов у которых нет книг из читального зала.

SELECT s.student_id, s.first_name
    FROM students s
        LEFT JOIN reading_room r
    ON s.student_id = r.student
    WHERE r.student IS NULL;

-- 7. Представления (минимум 2).

-- Создадим представление на таблицу students без персональной информации.

DROP VIEW IF EXISTS students_no_person_data;
CREATE VIEW students_no_person_data AS
SELECT last_name,
       first_name,
       patronymic,
       course,
       faculty
FROM students
WHERE student_id BETWEEN 1 AND 10;

SELECT * FROM students_no_person_data;

-- Студенты не сдавшие экзамен.

DROP VIEW IF EXISTS did_not_pass_the_exam;
CREATE VIEW did_not_pass_the_exam AS
SELECT students.first_name,
       students.last_name,
       exam_mark.mark
FROM students
    JOIN exam_mark
ON student_id = exam_mark.student
WHERE exam_mark.mark = 2;

SELECT * FROM did_not_pass_the_exam;

-- 8. Хранимые процедуры, триггеры.

-- Создаем функцию для нахождения наличия или отсутствия просроченной сдачи книг по id студента.

DROP FUNCTION IF EXISTS late_return_of_books;
DELIMITER |
CREATE FUNCTION late_return_of_books (student_ret INT)
  RETURNS VARCHAR(11)
   DETERMINISTIC
    BEGIN
     DECLARE output VARCHAR(11);
        IF CURRENT_TIMESTAMP() > (SELECT return_date FROM reading_room WHERE student = student_ret)
            THEN SET output = 'expired';
        ELSEIF  CURRENT_TIMESTAMP() <= (SELECT return_date FROM reading_room WHERE student = student_ret)
            THEN SET output = 'not_expired';
        END IF;
     RETURN output;
    END|

DELIMITER ;

SELECT late_return_of_books(5);

-- Обновляем записи для наглядности

UPDATE reading_room
SET return_date = '2021-06-10 18:00:00'
WHERE book BETWEEN 1 AND 7;

UPDATE reading_room
SET return_date = '2021-06-15 18:00:00'
WHERE book BETWEEN 7 AND 12;

-- Делаем интересующий нас запрос в котром учавствует наша функция.

SELECT student,
       book,
       return_date,
       CURRENT_TIMESTAMP() ,
       late_return_of_books(2)
FROM reading_room
WHERE student = 2;

-- Создаем процедуру чтобы выводить список студентов по нужной нам оценке за экзамен.

DROP PROCEDURE IF EXISTS mark_exam;
DELIMITER //
CREATE PROCEDURE mark_exam ( IN mark_ex int)
BEGIN
    SELECT student,
       CONCAT(first_name, ' ', last_name) AS name,
       mark
FROM exam_mark
JOIN students s
ON student_id = student
WHERE mark = mark_ex;
END //
DELIMITER ;

CALL mark_exam(5);

-- Создадим триггер для отдельного учета пересдач экзаменов

DROP TABLE IF EXISTS retake;
CREATE TABLE retake
(
    created_at DATETIME                           NOT NULL COMMENT 'Дата перездачи',
    student    INT UNSIGNED                       NULL COMMENT 'Студент',
    subjects   INT UNSIGNED                       NULL COMMENT 'Предмет',
    mark       INT CHECK ( mark BETWEEN 2 AND 5)  NULL COMMENT 'Оценка за экзамен'
) COMMENT 'Перездачи экзаменов'
    ENGINE = ARCHIVE;

SELECT * FROM retake;

DROP TRIGGER IF EXISTS retake_exam;
DELIMITER //
CREATE TRIGGER retake_exam
    AFTER UPDATE
    ON exam_mark
    FOR EACH ROW
BEGIN
    INSERT INTO retake(created_at, student, subjects, mark)
        VALUE (NOW(), NEW.student, NEW.subjects, NEW.mark);
end //
DELIMITER ;

UPDATE exam_mark
SET mark = 4
WHERE student = 6 AND subjects = 2;

SELECT * FROM retake;