set quoted_identifier on;
go

create function dbo.fn_GetDaysSinceLoan(@LoanId int)
	returns int as
		begin
			declare @Days int;

			select
				@Days = datediff(day, loandate, isnull(returndate, getdate()))
			from bookloans
			where loanid = @LoanId;

			return isnull(@Days, 0);
		end;
go
