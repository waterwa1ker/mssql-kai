declare @NewBookId int;
exec sp_AddBook
	@Title = 'New book',
	@AuthorFirstName = 'Steven',
	@AuthorLastName = 'King',
	@PublicationYear = 2025,
	@Price = 500,
	@NewBookId = @NewBookId output;

select @NewBookId new_book_id;
