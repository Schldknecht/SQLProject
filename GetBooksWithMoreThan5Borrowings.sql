-- Процедура для получения книг, взятых более 5 раз
CREATE PROCEDURE GetBooksWithMoreThan5Borrowings
AS
BEGIN
    SELECT b.title, COUNT(br.borrowing_id) AS borrow_count
    FROM borrowings br
    JOIN books b ON br.book_id = b.book_id
    GROUP BY b.title
    HAVING COUNT(br.borrowing_id) > 5;
END;

EXEC GetBooksWithMoreThan5Borrowings;
