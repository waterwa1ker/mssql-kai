set quoted_identifier on;
go

create function dbo.fn_GetAuthorStatistics()
returns @AuthorStats table (
	authorid int,
	authorname varchar(100),
	totalbooks int,
	avgprice decimal(10,2),
	mostexpensivebook varchar(100),
	mostexpensiveprice decimal(10,2),
	latestpublicationyear int
) as
	begin
			insert into @AuthorStats
			select
				a.authorid,
				a.firstname + ' ' + a.lastname authorname,
				count(b.bookid) totalbooks,
				avg(b.price) avgprice,
				max(b.title) mostexpensivebook,
				max(b.price) mostexpensiveprice,
				max(b.publicationyear) latestpublicationyear
			from authors a
			left join books b
				on a.authorid = b.authorid
			group by a.authorid, a.firstname, a.lastname
		
			return;
	end;
go
