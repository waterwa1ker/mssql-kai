-- Убедимся, что правильные SET OPTIONS установлены
SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

-- Удаляем если существует
IF OBJECT_ID('dbo.AuthorBooksIndexed', 'V') IS NOT NULL
    DROP VIEW dbo.AuthorBooksIndexed;
GO

-- Создаем представление с SCHEMABINDING
CREATE VIEW dbo.AuthorBooksIndexed
WITH SCHEMABINDING
AS
SELECT 
    a.AuthorID,
    a.FirstName,
    a.LastName,
    b.BookID,
    b.Title,
    b.PublicationYear,
    b.Price,
    COUNT_BIG(*) AS CountBig
FROM dbo.Authors a
INNER JOIN dbo.Books b ON a.AuthorID = b.AuthorID
GROUP BY a.AuthorID, a.FirstName, a.LastName, b.BookID, b.Title, b.PublicationYear, b.Price;
GO

-- Создаем уникальный кластерный индекс
CREATE UNIQUE CLUSTERED INDEX IX_AuthorBooksIndexed 
ON dbo.AuthorBooksIndexed (AuthorID, BookID);
GO
