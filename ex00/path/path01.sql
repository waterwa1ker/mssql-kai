select
	bl.bookid,
	count(bl.bookid) book_count,
	max(b.title_length) title_length
from bookloans bl
join ( 
	select
		b.bookid,
		b.title,
		len(b.title) title_length
	from books b
) b
	on b.bookid = bl.bookid
group by bl.bookid
order by 2, 3 desc
for xml path
