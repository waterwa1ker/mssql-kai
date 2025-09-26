create trigger trg_book_loans_instead_of_insert
	on bookloans
	instead of insert as
		begin
			set nocount on;

			if exists (
				select
					i.readerid
				from inserted i
				join (
					select
						readerid,
						count(*) active_loans
					from bookloans
					where returndate is null
					group by readerid
				) rl
					on rl.readerid = i.readerid
				where rl.active_loans >= 3
			) 
			begin
				raiserror('Reader cant get more than 3 books', 16, 1);
				return;
			end

			if exists (
				select 1 from inserted
				where loandate > getdate()
			) begin
				raiserror('Uncorrect date of loan', 16, 1);
				return;
			end

			insert into bookloans (bookid, readerid, loandate, returndate)
				select
					bookid,
					readerid,
					loandate,
					returndate
				from inserted;

		end;
go
