set quoted_identifier on;
go

insert into books (title, authorid, publicationyear, price)
	values ('test', 5, 2024, 5000);

update books
	set price = 6000
	where title = 'test';

delete from books
	where title = 'test';

select * from booksaudit
order by changedate desc;
