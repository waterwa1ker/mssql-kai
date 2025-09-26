drop view BooksAfter1870;
go

create view BooksAfter1870 as
	select
		bookid,
		title,
		authorid,
		publicationyear,
		price
	from books
	where publicationyear > 1870
	with check option;
go
