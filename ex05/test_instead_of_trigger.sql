select
	*
from bookloans
where returndate is null;

insert into bookloans (bookid, readerid, loandate)
values (1, 2, getdate());

insert into bookloans (bookid, readerid, loandate)
values (2, 3, getdate());

select * from bookloans
order by loandate desc;
