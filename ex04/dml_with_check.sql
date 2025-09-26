insert into 
	BooksAfter1870 (title, authorid, publicationyear, price)
	values ('New book', 4, 1880, 1000);

insert into BooksAfter1870 (
	title, 
	authorid, 
	publicationyear, 
	price
)
values (
	'Book from 1865',
	5,
	1865,
	3500
)	

update BooksAfter1870
	set publicationyear = 1860
	where bookid = 2;

delete from BooksAfter1870
	where bookid = 4;
