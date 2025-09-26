set statistics xml on;
select
	authorid,
	authorname,
	count(*) book_count
from authorstatistics
group by authorid, authorname;

set statistics xml off;
go

set statistics xml on;
select
	authorid,
	firstname,
	lastname,
	count(*) book_count
from authorbooksindexed
group by authorid, firstname, lastname;

set statistics xml off;
go
