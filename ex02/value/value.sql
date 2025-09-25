SET QUOTED_IDENTIFIER ON;

select
	readerid,
	firstname,
	email,
	reader_details.value('(/personal/phone)[1]', 'nvarchar(50)') phone,
	reader_details.value('(/personal/address)[1]', 'nvarchar(100)') address,
	reader_details.value('(/preferences/favoriteGenres/genre)[2]', 'nvarchar(50)') genre,
	reader_details.value('(/preferences/notificationEnabled)[1]', 'bit') notificationEnabled
from readers
