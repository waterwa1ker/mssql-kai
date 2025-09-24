select 
	b.title, 
	a.lastname, 
	bl.loanid, 
	bl.loandate, 
	r.email reader_email 
from bookloans bl 
join books b 
	on b.bookid = bl.bookid 
join authors a 
	on a.authorid = b.authorid 
join readers r 
	on r.readerid = bl.readerid
for xml raw
