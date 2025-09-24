select
	r.firstname,
	r.lastname,
	r.email,
	ba.*
from readers r
join (
	select 
		bl.readerid,
		count(bl.readerid) book_loans
	from bookloans bl
	group by bl.readerid
) ba
	on ba.readerid = r.readerid
for xml auto
