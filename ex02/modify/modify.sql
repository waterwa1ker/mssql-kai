SET QUOTED_IDENTIFIER ON;

update readers
	set reader_details.modify('
		insert <membershipType>Gold</membershipType>
		after (/personal/registrationDate)[1]
	')
where readerid = 1;
