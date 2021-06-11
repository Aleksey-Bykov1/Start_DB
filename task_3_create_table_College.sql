-- Создаем базу Колледж
DROP DATABASE IF EXISTS College;
CREATE DATABASE College;
USE College;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities
(
    cities_id  INT UNSIGNED AUTO_INCREMENT COMMENT 'Идентификатор города'
        PRIMARY KEY,
    city_name  VARCHAR(255) UNIQUE                NOT NULL COMMENT 'Название города',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL comment 'Время создания строки'
)
    COMMENT 'Города' COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty
(
    faculty_id   INT UNSIGNED COMMENT 'Идентификатор факультета'
        PRIMARY KEY,
    faculty_name VARCHAR(100)                       NOT NULL COMMENT 'Название факультета',
    created_at   DATETIME DEFAULT CURRENT_TIMESTAMP NULL comment 'Время создания строки',
    updated_at   DATETIME DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP comment 'Время обновления строки'
)
    COMMENT 'Факультет' COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS students;
CREATE TABLE students
(
    student_id INT UNSIGNED AUTO_INCREMENT COMMENT 'Идентификатор студента'
        PRIMARY KEY,
    last_name  VARCHAR(100)                       NOT NULL COMMENT 'Фамилия студента',
    first_name VARCHAR(100)                       NOT NULL COMMENT 'Имя студента',
    patronymic VARCHAR(100)                       NOT NULL COMMENT 'Отчество студента',
    course     INT UNSIGNED                       NOT NULL COMMENT 'Номер курса',
    faculty    INT UNSIGNED                       NULL COMMENT 'Факультет',
    city       INT UNSIGNED                       NULL COMMENT 'Город',
    birthday   DATE                               NOT NULL COMMENT 'Дата рождения',
    email      VARCHAR(100)                       NOT NULL COMMENT 'Почта студента',
    phone      VARCHAR(100)                       NOT NULL COMMENT 'Телефон студента',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL comment 'Время создания строки',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP comment 'Время обновления строки',
    CONSTRAINT email
        UNIQUE (email),
    CONSTRAINT phone
        UNIQUE (phone),
    CONSTRAINT city_id
        FOREIGN KEY (city) REFERENCES cities (cities_id)
            ON DELETE SET NULL,
    CONSTRAINT faculty_id
        FOREIGN KEY (faculty) REFERENCES faculty (faculty_id)
            ON DELETE SET NULL
)
    COMMENT 'Студенты' COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects
(
    subj_id    INT UNSIGNED AUTO_INCREMENT COMMENT 'Идентификатор предмета'
        PRIMARY KEY,
    subj_name  VARCHAR(100) UNIQUE                NOT NULL COMMENT 'Название предмета',
    hour       INT UNSIGNED                       NOT NULL COMMENT 'Количество часов, отводимых на изучение предмета',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL comment 'Время создания строки',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP comment 'Время обновления строки'
)
    COMMENT 'Предметы' COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS lecturers;
CREATE TABLE lecturers
(
    lecturers_id INT UNSIGNED AUTO_INCREMENT COMMENT 'Идентификатор преподавателя'
        PRIMARY KEY,
    last_name    VARCHAR(100)                       NOT NULL COMMENT 'Фамилия преподавателя',
    first_name   VARCHAR(100)                       NOT NULL COMMENT 'Имя преподавателя',
    patronymic   VARCHAR(100)                       NOT NULL COMMENT 'Отчество преподавателя',
    subjects     INT UNSIGNED                       NULL COMMENT 'Предмет который ведет преподаватель',
    city         INT UNSIGNED                       NULL COMMENT 'Город',
    birthday     DATE                               NOT NULL COMMENT 'Дата рождения',
    email        VARCHAR(100)                       NOT NULL COMMENT 'Почта преподавателя',
    phone        VARCHAR(100)                       NOT NULL COMMENT 'Телефон преподавателя',
    created_at   DATETIME DEFAULT CURRENT_TIMESTAMP NULL comment 'Время создания строки',
    updated_at   DATETIME DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP comment 'Время обновления строки',
    CONSTRAINT email
        UNIQUE (email),
    CONSTRAINT phone
        UNIQUE (phone),
    CONSTRAINT subjects_id
        FOREIGN KEY (subjects) REFERENCES subjects (subj_id)
            ON DELETE SET NULL,
    CONSTRAINT lec_city_id
        FOREIGN KEY (city) REFERENCES cities (cities_id)
            ON DELETE SET NULL
)
    COMMENT 'Преподаватели' COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS exam_mark;
CREATE TABLE exam_mark
(
    exam_id    INT UNSIGNED AUTO_INCREMENT COMMENT 'Идентификатор экзамена'
        PRIMARY KEY,
    student    INT UNSIGNED                       NULL COMMENT 'Студент',
    subjects   INT UNSIGNED                       NULL COMMENT 'Предмет',
    mark       INT CHECK ( mark BETWEEN 2 AND 5)  NULL COMMENT 'Оценка за экзамен',
    exam_date  DATETIME                           NULL COMMENT 'Дата экзамена',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP comment 'Время обновления строки',
    CONSTRAINT exam_stud_id
        FOREIGN KEY (student) REFERENCES students (student_id)
            ON DELETE CASCADE,
    CONSTRAINT exam_subj_id
        FOREIGN KEY (subjects) REFERENCES subjects (subj_id)
            ON DELETE NO ACTION
)
    COMMENT 'Оценки за экзамены' COLLATE = utf8_unicode_ci;

TRUNCATE exam_mark;

DROP TABLE IF EXISTS company_for_internship;
CREATE TABLE company_for_internship
(
    company_id INT UNSIGNED AUTO_INCREMENT COMMENT 'Идентификатор компании'
        PRIMARY KEY,
    company_name VARCHAR(100)                       NOT NULL COMMENT 'Название компании',
    city INT UNSIGNED                               NULL     COMMENT 'Город',
    created_at   DATETIME DEFAULT CURRENT_TIMESTAMP NULL     COMMENT 'Время создания строки',
    updated_at   DATETIME DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP comment 'Время обновления строки',
    CONSTRAINT com_city_id
        FOREIGN KEY (city) REFERENCES cities (cities_id)
            ON DELETE SET NULL
)
    COMMENT 'Компании для стажировки' COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS internship;
CREATE TABLE internship
(
    int_student_id     INT UNSIGNED                             NOT NULL COMMENT 'Идентификатор студента',
    company_internship INT UNSIGNED                             NOT NULL COMMENT 'Идентификатор компании',
    length_of_day      INT UNSIGNED                             NULL COMMENT 'Длительность стажировки',
    intern_mark        INT CHECK ( intern_mark BETWEEN 2 AND 5) NULL COMMENT 'Оценка за стажировку',
    CONSTRAINT prim_key_intern
        PRIMARY KEY (int_student_id, company_internship),
    CONSTRAINT int_student_id
        FOREIGN KEY (int_student_id) REFERENCES students (student_id)
            ON DELETE CASCADE,
    CONSTRAINT company_internship
        FOREIGN KEY (company_internship) REFERENCES company_for_internship (company_id)
            ON DELETE NO ACTION
)
    COMMENT 'Стажировка' COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS library;
CREATE TABLE library
(
    book_id    INT UNSIGNED AUTO_INCREMENT COMMENT 'Идентификатор книги'
        PRIMARY KEY,
    title      VARCHAR(200)                       NOT NULL COMMENT 'Название книги',
    author     VARCHAR(100)                       NOT NULL COMMENT 'Автор',
    amount     INT UNSIGNED                       NULL COMMENT 'Колличество',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL COMMENT 'Время создания строки',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP comment 'Время обновления строки'
)
    COMMENT 'Библиотека' COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS reading_room;
CREATE TABLE reading_room
(
    student       INT UNSIGNED NOT NULL COMMENT 'Идентификатор студента',
    book          INT UNSIGNED NOT NULL COMMENT 'Идентификатор книги',
    date_of_issue DATETIME     NULL COMMENT 'Дата выдачи',
    return_date   DATETIME     NULL COMMENT 'Дата возврата',
    CONSTRAINT prim_read_id
        PRIMARY KEY (student, book),
    CONSTRAINT stud_id
        FOREIGN KEY (student) REFERENCES students (student_id)
            ON DELETE CASCADE,
    CONSTRAINT read_book
        FOREIGN KEY (book) REFERENCES library (book_id)
            ON DELETE CASCADE
)
    COMMENT 'Читальный зал' COLLATE = utf8_unicode_ci;

-- Индексы лучше создавать на основе анализа запросов в базу данны, но в учебных целях создим несколько
-- индексов для полей с предположительно самым большим наполнением.

CREATE INDEX city_id
    ON students(city);

CREATE INDEX lec_city_id
    ON lecturers(city);

-- Создадим составной индекс для поиска по фамилии имени и отчеству студента или преподавателя

CREATE INDEX stud_l_f_p
    ON students(last_name, first_name, patronymic);

CREATE INDEX lect_l_f_p
    ON lecturers(last_name, first_name, patronymic);

