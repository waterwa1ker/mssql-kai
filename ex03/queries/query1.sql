SET SHOWPLAN_XML ON;
go

SELECT 
    r.ReaderID,
    r.FirstName + ' ' + r.LastName AS ReaderName,
    r.Email,
    COUNT(bl.LoanID) AS TotalBooksBorrowed,
    COUNT(CASE WHEN bl.ReturnDate IS NULL THEN 1 END) AS CurrentlyBorrowed,
    MAX(bl.LoanDate) AS LastBorrowDate,
    AVG(DATEDIFF(DAY, bl.LoanDate, ISNULL(bl.ReturnDate, GETDATE()))) AS AvgBorrowDays
FROM Readers r
LEFT JOIN BookLoans bl ON r.ReaderID = bl.ReaderID
GROUP BY r.ReaderID, r.FirstName, r.LastName, r.Email
HAVING COUNT(bl.LoanID) > 0
ORDER BY TotalBooksBorrowed DESC, ReaderName;
