select
	name view_name,
	object_id,
	create_date,
	modify_date
from sys.views
where type = 'V'
order by 1;
