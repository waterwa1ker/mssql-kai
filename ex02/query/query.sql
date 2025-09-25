SET QUOTED_IDENTIFIER ON;

select
	readerid,
	firstname,
	email,
	reader_details.query('/personal/phone') phone,
	reader_details.query('/personal/address') address,
	reader_details.query('/personal/registrationDate') registration_date
from readers
