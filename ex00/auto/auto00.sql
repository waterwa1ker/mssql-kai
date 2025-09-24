select
	top 1
	a.firstname,
	a.lastname,
	b.title,
	b.publicationyear,
	b.price
from books b
join authors a
	on a.authorid = b.authorid
order by b.price desc
for xml auto
