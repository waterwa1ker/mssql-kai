create view BooksAfter1870 as
	select
		bookid,
		title,
		authorid,
		publicationyear,
		price
	from books
	where publicationyear > 1870;
