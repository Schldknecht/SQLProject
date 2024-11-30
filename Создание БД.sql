-- Создание базы данных
CREATE DATABASE library;
GO

-- Переключаемся на базу данных 'library'
USE library;
GO

-- Создание таблицы authors (Авторы)
CREATE TABLE authors (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    death_date DATE
);
GO

-- Создание таблицы publishers (Издательства)
CREATE TABLE publishers (
    publisher_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100)
);
GO

-- Создание таблицы categories (Категории)
CREATE TABLE categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
GO

-- Создание таблицы books (Книги)
CREATE TABLE books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    category_id INT,
    publisher_id INT,
    publication_year INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);
GO

-- Создание таблицы members (Члены библиотеки)
CREATE TABLE members (
    member_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    registration_date DATE
);
GO

-- Создание таблицы borrowings (Заимствования)
CREATE TABLE borrowings (
    borrowing_id INT IDENTITY(1,1) PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrowing_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
GO

-- Создание таблицы reviews (Отзывы)
CREATE TABLE reviews (
    review_id INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT,
    member_id INT,
    review_text TEXT,
    rating INT,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
GO

-- Создание таблицы book_copies (Копии книг)
CREATE TABLE book_copies (
    copy_id INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT,
    availability BIT,  -- Используем BIT вместо BOOLEAN
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
GO

-- Наполнение данных
-- Заполнение таблицы authors (Авторы)
INSERT INTO authors (name, birth_date, death_date)
VALUES 
('John Doe', '1970-01-01', NULL),
('Jane Smith', '1985-06-15', NULL),
('George Orwell', '1903-06-25', '1950-01-21'),
('Mark Twain', '1835-11-30', '1910-04-21'),
('Isaac Asimov', '1920-01-02', '1992-04-06'),
('Arthur C. Clarke', '1917-12-16', '2008-03-19'),
('J.K. Rowling', '1965-07-31', NULL),
('Agatha Christie', '1890-09-15', '1976-01-12'),
('Stephen King', '1947-09-21', NULL),
('J.R.R. Tolkien', '1892-01-03', '1973-09-02');

-- Заполнение таблицы publishers (Издательства)
INSERT INTO publishers (name, country)
VALUES 
('TechBooks', 'USA'),
('DevPress', 'UK'),
('DataWorld', 'USA'),
('FictionHouse', 'UK'),
('FantasyPress', 'USA'),
('LiteraryMedia', 'Canada'),
('BookWorld', 'Australia'),
('ClassicPublishers', 'UK'),
('SciFiHouse', 'USA'),
('MysteriousBooks', 'UK');

-- Заполнение таблицы categories (Категории)
INSERT INTO categories (category_name)
VALUES 
('Database'),
('Programming'),
('Science Fiction'),
('Fantasy'),
('Mystery'),
('Thriller'),
('Historical'),
('Biography'),
('Horror'),
('Literature');

-- Заполнение таблицы books (Книги)
INSERT INTO books (title, author_id, category_id, publisher_id, publication_year, price)
VALUES 
('Introduction to SQL', 1, 1, 1, 2020, 39.99),
('SQL for Beginners', 2, 1, 2, 2021, 29.99),
('Advanced SQL Queries', 1, 1, 3, 2019, 49.99),
('The Hobbit', 7, 3, 4, 1937, 19.99),
('1984', 3, 3, 5, 1949, 15.99),
('Harry Potter and the Philosopher''s Stone', 7, 4, 6, 1997, 29.99),
('Murder on the Orient Express', 8, 5, 7, 1934, 10.99),
('The Shining', 9, 6, 8, 1977, 14.99),
('The Lord of the Rings', 10, 4, 9, 1954, 39.99),
('Foundation', 5, 3, 10, 1951, 24.99);

-- Заполнение таблицы members (Члены библиотеки)
INSERT INTO members (name, registration_date)
VALUES 
('Alice Johnson', '2021-06-01'),
('Bob Martin', '2022-07-15'),
('Charlie Green', '2020-03-12'),
('David White', '2019-08-25'),
('Eve Black', '2023-01-10'),
('Frank Harris', '2021-11-20'),
('Grace Wilson', '2020-02-17'),
('Helen Adams', '2019-12-08'),
('Ivan Scott', '2022-05-05'),
('Jack Lee', '2023-09-22');

-- Заполнение таблицы borrowings (Заимствования)
INSERT INTO borrowings (member_id, book_id, borrowing_date, return_date)
VALUES 
(1, 1, '2023-11-01', '2023-11-10'),
(2, 3, '2023-08-15', '2023-08-30'),
(3, 2, '2023-09-01', '2023-09-10'),
(4, 7, '2023-10-01', '2023-10-15'),
(5, 8, '2023-11-10', '2023-11-20'),
(6, 4, '2023-09-15', '2023-09-25'),
(7, 5, '2023-07-01', '2023-07-15'),
(8, 6, '2023-10-10', '2023-10-20'),
(9, 9, '2023-06-01', '2023-06-10'),
(10, 10, '2023-08-05', '2023-08-15');

-- Заполнение таблицы reviews (Отзывы)
INSERT INTO reviews (book_id, member_id, review_text, rating)
VALUES 
(1, 1, 'Great introduction to SQL for beginners.', 5),
(2, 2, 'Perfect for learning SQL basics.', 4),
(3, 1, 'A bit too advanced for me, but helpful.', 3),
(4, 4, 'A fantastic read, loved the adventure.', 5),
(5, 5, 'Dystopian classic, a must-read!', 4),
(6, 7, 'A magical and engaging start to the series.', 5),
(7, 8, 'A gripping mystery with great twists.', 4),
(8, 9, 'Stephen King at his best. Terrifying and thrilling!', 5),
(9, 10, 'An epic fantasy story, truly unforgettable.', 5),
(10, 3, 'Asimov’s vision of the future is remarkable.', 4);

-- Заполнение таблицы book_copies (Копии книг)
INSERT INTO book_copies (book_id, availability)
VALUES 
(1, 1),
(2, 1),
(3, 0),
(4, 1),
(5, 1),
(6, 1),
(7, 0),
(8, 1),
(9, 1),
(10, 1);


--Выгрузки
-- Запрос возвращает список книг с дополнительной статистикой по рейтингам и заимствованиям, отфильтрованный по вашим условиям.

-- Сложный запрос для выгрузки данных из базы данных 'library'
SELECT DISTINCT
    b.book_id,                             -- Идентификатор книги
    b.title AS BookTitle,                  -- Название книги
    a.name AS AuthorName,                  -- Автор книги
    c.category_name AS Category,           -- Категория книги
    p.name AS PublisherName,               -- Издатель книги
    b.publication_year,                    -- Год публикации книги
    b.price,                               -- Цена книги
    AVG(r.rating) AS AverageRating,        -- Средний рейтинг книги
    COUNT(br.borrowing_id) AS TotalBorrows -- Общее количество заимствований книги
FROM books b
-- Объединяем таблицу с авторами, категориями и издателями
JOIN authors a ON b.author_id = a.author_id
JOIN categories c ON b.category_id = c.category_id
JOIN publishers p ON b.publisher_id = p.publisher_id
-- Левый JOIN для таблицы отзывов (чтобы показать книги без отзывов)
LEFT JOIN reviews r ON b.book_id = r.book_id
-- Левый JOIN для таблицы borrowings (чтобы показать все книги, даже если они не были заимствованы)
LEFT JOIN borrowings br ON b.book_id = br.book_id
-- Фильтруем книги, которые были опубликованы в последние 5 лет
WHERE b.publication_year >= YEAR(GETDATE()) - 5
-- Дополнительный фильтр для книг, чье название содержит 'SQL'
AND b.title LIKE '%SQL%'
-- Группируем по книгам, авторам, категориям и издателям
GROUP BY
    b.book_id,
    b.title,
    a.name,
    c.category_name,
    p.name,
    b.publication_year,
    b.price
-- Отбираем только книги, у которых средний рейтинг выше 4
HAVING AVG(r.rating) > 4
-- Сортируем по категории, затем по автору, затем по средней оценке
ORDER BY
    c.category_name ASC,
    a.name ASC,
    AverageRating DESC;
