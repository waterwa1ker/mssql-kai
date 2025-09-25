SET STATISTICS XML ON;
go

SELECT 
    YEAR(bl.LoanDate) AS Year,
    MONTH(bl.LoanDate) AS Month,
    DATENAME(MONTH, bl.LoanDate) AS MonthName,
    COUNT(bl.LoanID) AS TotalLoans,
    COUNT(DISTINCT bl.ReaderID) AS UniqueReaders,
    COUNT(DISTINCT b.AuthorID) AS UniqueAuthors,
    AVG(b.Price) AS AvgBookPrice,
    SUM(CASE WHEN bl.ReturnDate IS NULL THEN 1 ELSE 0 END) AS ActiveLoans
FROM BookLoans bl
INNER JOIN Books b ON bl.BookID = b.BookID
WHERE YEAR(bl.LoanDate) = 2024
GROUP BY YEAR(bl.LoanDate), MONTH(bl.LoanDate), DATENAME(MONTH, bl.LoanDate)
ORDER BY Year, Month;
