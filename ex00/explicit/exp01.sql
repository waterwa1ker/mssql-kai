select
	1 Tag,
	null Parent,
	r.readerid [reader!1!readerId],
	r.firstname [reader!1!firstName!element],
	r.lastname [reader!1!lastName!element],
	r.email [reader!1!email!element],
	null [bookLoan!2!loanId],
	null [bookLoan!2!loanDate!element],
	null [bookLoan!2!returnDate!element],
	null [book!3!bookId],
        null [book!3!title!element]

from readers r

union all

select
	2 Tag,
	1 Parent,
	r.readerid [reader!1!readerId],
	r.firstname [reader!1!firstName!element],
        r.lastname [reader!1!lastName!element],
        r.email [reader!1!email!element],
	bl.loanid [bookLoan!2!loanId],
	bl.loandate [bookLoan!2!loanDate!element],
	bl.returndate [bookLoan!2!returnDate!element],
	null [book!3!bookId],
	null [book!3!title!element]
from bookloans bl
join readers r
	on r.readerid = bl.readerid

union all

select
	3 Tag,
	2 Parent,
	r.readerid [reader!1!readerId],
        r.firstname [reader!1!firstName!element],
        r.lastname [reader!1!lastName!element],
        r.email [reader!1!email!element],
        bl.loanid [bookLoan!2!loanId],
        bl.loandate [bookLoan!2!loanDate!element],
        bl.returndate [bookLoan!2!returnDate!element],
	b.bookid [book!3!bookId],
	b.title [book!3!title!element]

from books b
join bookloans bl
	on bl.bookid = b.bookid
join readers r
	on r.readerid = bl.readerid

order by [reader!1!readerId], Tag

for xml explicit
