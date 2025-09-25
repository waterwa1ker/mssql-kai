SET QUOTED_IDENTIFIER ON;

select
	readerid,
	firstname,
	lastname,
	email,
	reader_details.exist('/personal/phone') has_phone,
	reader_details.exist('/personal/address') has_address,
	reader_details.exist('/personal/password') has_password,
	reader_details.exist('/preferences/favoriteGenres/genre') has_favorite_genre
from readers
