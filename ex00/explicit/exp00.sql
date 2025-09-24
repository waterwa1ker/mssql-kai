select
	1 Tag,
	null Parent,
	a.authorid [author!1!id],
	a.lastname [author!1!lastname],
	null [book!2!title],
	null [book!2!publicationYear]
from authors a

union all

select
	2 Tag,
	1 Parent,
	a.authorid [author!1!id],
	a.lastname [author!1!lastname],
	b.title [book!2!title],
	b.publicationyear [book!2!publicationYear]
from books b
join authors a
	on a.authorid = b.authorid

order by [author!1!id], Tag

for xml explicit
