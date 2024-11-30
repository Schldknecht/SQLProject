-- Функция для получения среднего рейтинга книги
CREATE FUNCTION GetAverageRating (@book_id INT)
RETURNS DECIMAL(3,2)
AS
BEGIN
    DECLARE @avg_rating DECIMAL(3,2);
    SELECT @avg_rating = AVG(rating) 
    FROM reviews 
    WHERE book_id = @book_id;
    RETURN @avg_rating;
END;

SELECT dbo.GetAverageRating(2);
