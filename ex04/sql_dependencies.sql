select
	object_name(d.object_id) view_name,
	object_name(d.referenced_major_id) referenced_table,
	d.referenced_minor_id column_id
from sys.sql_dependencies d
where
	object_name(d.referenced_major_id) = 'Books'
	and objectproperty(d.object_id, 'IsView') = 1;
