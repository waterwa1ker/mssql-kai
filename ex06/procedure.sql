SET QUOTED_IDENTIFIER ON;
go

create procedure sp_AddBook
	@Title nvarchar(100),
	@AuthorFirstName nvarchar(50),
	@AuthorLastName nvarchar(100),
	@PublicationYear int,
	@Price decimal(10,2),
	@NewBookId int output
as
	begin
		set nocount on;

		declare @AuthorId int;

		select 
			@AuthorId = authorid
		from authors
		where
			firstname = @AuthorFirstName
			and lastname = @AuthorLastName;

		if @AuthorId is null
		begin
			insert into authors (firstname, lastname)
				values (@AuthorFirstName, @AuthorLastName);

			set @AuthorId = scope_identity();
			print 'New author created'
		end

		insert into books (title, authorid, publicationyear, price)
		values (@Title, @AuthorId, @PublicationYear, @Price);

		set @NewBookId = scope_identity();
		print 'New book added';
	end;
go
