set quoted_identifier on;
go

create function dbo.fn_GetActiveLoansByReader(@ReaderId int)
returns table as
	return (
		select
			bl.loanid,
			b.title,
			a.firstname + ' ' + a.lastname author_name,
			bl.loandate,
			datediff(day, bl.loandate, getdate()) days_borrowed
		from bookloans bl
		join books b
			on bl.bookid = b.bookid
		join authors a
			on a.authorid = b.authorid
		where 
			bl.readerid = @ReaderId
			and bl.returndate is null
	);
go
