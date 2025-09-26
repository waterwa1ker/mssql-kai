create table BooksAudit (
	AuditId int identity(1,1) primary key,
	BookId int not null,
	ActionType varchar(10) not null,
	OldTitle nvarchar(100),
	NewTitle nvarchar(100),
	OldPrice decimal(10,2),
	NewPrice decimal(10,2),
	ChangedBy varchar(100) default system_user,
	ChangeDate datetime default getdate()
);
go

create trigger trg_books_audit
	on books
	after insert, update, delete as
		begin
			set nocount on;

			insert into booksaudit (bookid, actiontype, newtitle, newprice)
				select
					i.bookid,
					'INSERT',
					title,
					price
				from inserted i
				where not exists (select 1 from deleted d where d.bookid = i.bookid);

			insert into booksaudit (bookid, actiontype, oldtitle, oldprice)
				select
					bookid,
					'DELETE',
					title,
					price
				from deleted d
				where not exists (select 1 from inserted i where i.bookid = d.bookid);

			insert into booksaudit (bookid, actiontype, oldtitle, newtitle, oldprice, newprice)
				select
					i.bookid,
					'UPDATE',
					d.title,
					i.title,
					d.price,
					i.price
				from inserted i
				join deleted d
					on i.bookid = d.bookid
				where 
					i.title <> d.title 
					or i.price <> d.price
					or (i.title is null and d.title is not null)
					or (i.title is not null and d.title is null)
					or (i.price is null and d.price is not null)
					or (i.price is not null and d.price is null);
	end;
go
