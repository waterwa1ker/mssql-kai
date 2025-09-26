CREATE VIEW BookLoansDetails
AS
SELECT 
    bl.LoanID,
    b.Title,
    a.FirstName + ' ' + a.LastName AS AuthorName,
    r.FirstName + ' ' + r.LastName AS ReaderName,
    bl.LoanDate,
    bl.ReturnDate,
    CASE 
        WHEN bl.ReturnDate IS NULL THEN 'В процессе'
        ELSE 'Возвращена'
    END AS LoanStatus
FROM BookLoans bl
INNER JOIN Books b ON bl.BookID = b.BookID
INNER JOIN Authors a ON b.AuthorID = a.AuthorID
INNER JOIN Readers r ON bl.ReaderID = r.ReaderID;
GO

CREATE VIEW AuthorStatistics
AS
SELECT 
    a.AuthorID,
    a.FirstName + ' ' + a.LastName AS AuthorName,
    COUNT(b.BookID) AS TotalBooks,
    AVG(b.Price) AS AvgPrice,
    MAX(b.PublicationYear) AS LatestPublication
FROM Authors a
LEFT JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY a.AuthorID, a.FirstName, a.LastName;
GO

CREATE VIEW ReaderActivity
AS
SELECT 
    r.ReaderID,
    r.FirstName + ' ' + r.LastName AS ReaderName,
    r.Email,
    COUNT(bl.LoanID) AS TotalLoans,
    COUNT(CASE WHEN bl.ReturnDate IS NULL THEN 1 END) AS ActiveLoans,
    MAX(bl.LoanDate) AS LastLoanDate
FROM Readers r
LEFT JOIN BookLoans bl ON r.ReaderID = bl.ReaderID
GROUP BY r.ReaderID, r.FirstName, r.LastName, r.Email;
GO

CREATE VIEW BookRankingByPrice
AS
SELECT 
    BookID,
    Title,
    AuthorID,
    PublicationYear,
    Price,
    RANK() OVER (ORDER BY Price DESC) AS PriceRank,
    DENSE_RANK() OVER (PARTITION BY AuthorID ORDER BY PublicationYear DESC) AS AuthorPublicationRank
FROM Books;
GO

CREATE VIEW BooksWithLoanCount
AS
SELECT 
    b.BookID,
    b.Title,
    a.FirstName + ' ' + a.LastName AS AuthorName,
    b.PublicationYear,
    b.Price,
    COUNT(bl.LoanID) AS TimesBorrowed,
    COUNT(CASE WHEN bl.ReturnDate IS NULL THEN 1 END) AS CurrentlyBorrowed
FROM Books b
INNER JOIN Authors a ON b.AuthorID = a.AuthorID
LEFT JOIN BookLoans bl ON b.BookID = bl.BookID
GROUP BY b.BookID, b.Title, a.FirstName, a.LastName, b.PublicationYear, b.Price;
GO
