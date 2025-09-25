SET SHOWPLAN_XML ON;
go

SELECT 
    a.AuthorID,
    a.FirstName + ' ' + a.LastName AS AuthorName,
    a.BirthDate,
    COUNT(b.BookID) AS TotalBooks,
    COUNT(bl.LoanID) AS TotalLoans,
    SUM(b.Price) AS TotalBookValue,
    AVG(b.Price) AS AvgBookPrice,
    MIN(b.PublicationYear) AS FirstPublication,
    MAX(b.PublicationYear) AS LastPublication
FROM Authors a
LEFT JOIN Books b ON a.AuthorID = b.AuthorID
LEFT JOIN BookLoans bl ON b.BookID = bl.BookID
GROUP BY a.AuthorID, a.FirstName, a.LastName, a.BirthDate
ORDER BY TotalLoans DESC, TotalBookValue DESC;
