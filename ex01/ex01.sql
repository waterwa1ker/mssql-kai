alter table readers
	drop column reader_details;

alter table readers
	add
		reader_details xml null;

update readers set reader_details = '
<personal>
    <phone>+7-999-123-45-67</phone>
    <address>Moscow, Lenina st. 10</address>
    <registrationDate>2023-01-15</registrationDate>
</personal>
<preferences>
    <favoriteGenres>
        <genre>Fiction</genre>
        <genre>Science</genre>
    </favoriteGenres>
    <notificationEnabled>true</notificationEnabled>
</preferences>'

SET QUOTED_IDENTIFIER ON;

select
	r.reader_details.value('(/personal/phone)[1]', 'nvarchar(50)') phone,
	r.reader_details.value('(/personal/address)[1]', 'nvarchar(50)') address,
	r.reader_details.value('(/preferences/favoriteGenres/genre)[2]', 'nvarchar(50)') genre
from readers r;
