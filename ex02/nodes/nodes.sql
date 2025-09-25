SET QUOTED_IDENTIFIER ON;

SELECT 
    r.readerid,
    p.personal.value('(phone)[1]', 'nvarchar(50)') as phone,
    p.personal.value('(address)[1]', 'nvarchar(100)') as address,
    p.personal.value('(registrationDate)[1]', 'date') as reg_date
FROM readers r
CROSS APPLY r.reader_details.nodes('/personal') as p(personal);
