select
	r.email,
	bl.*
from bookloans bl
join readers r
	on r.readerid = bl.readerid
where 
	bl.returndate is null
for xml raw
