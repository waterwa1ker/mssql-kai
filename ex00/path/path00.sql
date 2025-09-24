select
	a.firstname,
	a.lastname,
	ba.book_count
from authors a
join (
	select
		b.authorid,
		count(b.authorid) book_count
	from books b
	group by b.authorid
) ba 
	on ba.authorid = a.authorid
for xml path
