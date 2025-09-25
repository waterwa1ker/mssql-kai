SET STATISTICS XML ON;
go

SELECT 
    bl.LoanID,
    r.FirstName + ' ' + r.LastName AS ReaderName,
    b.Title,
    a.FirstName + ' ' + a.LastName AS AuthorName,
    bl.LoanDate,
    bl.ReturnDate,
    DATEDIFF(DAY, bl.LoanDate, ISNULL(bl.ReturnDate, GETDATE())) AS DaysBorrowed,
    CASE 
        WHEN bl.ReturnDate IS NULL AND DATEDIFF(DAY, bl.LoanDate, GETDATE()) > 30 
        THEN 'Overdue'
        WHEN bl.ReturnDate IS NULL 
        THEN 'Using'
        ELSE 'Returned'
    END AS LoanStatus,
    b.Price
FROM BookLoans bl
INNER JOIN Readers r ON bl.ReaderID = r.ReaderID
INNER JOIN Books b ON bl.BookID = b.BookID
INNER JOIN Authors a ON b.AuthorID = a.AuthorID
WHERE bl.LoanDate >= '2024-01-01'
ORDER BY 
    CASE WHEN bl.ReturnDate IS NULL THEN 0 ELSE 1 END,
    DaysBorrowed DESC;
