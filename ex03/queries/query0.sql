SET SHOWPLAN_XML ON;
go

SELECT TOP 3
    b.BookID,
    b.Title,
    a.FirstName + ' ' + a.LastName AS AuthorName,
    COUNT(bl.LoanID) AS TotalLoans,
    COUNT(CASE WHEN bl.ReturnDate IS NULL THEN 1 END) AS CurrentlyBorrowed
FROM Books b
INNER JOIN Authors a ON b.AuthorID = a.AuthorID
LEFT JOIN BookLoans bl ON b.BookID = bl.BookID
GROUP BY b.BookID, b.Title, a.FirstName, a.LastName
ORDER BY TotalLoans DESC;
