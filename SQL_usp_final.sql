USE db_library_final


--Drill 1
CREATE PROCEDURE usp_final_1
AS
SELECT a1.book_title, a2.branch_name, a3.copies_number FROM tbl_bookCopies a3
	INNER JOIN tbl_branch a2 ON copies_branch_id = branch_id
	INNER JOIN tbl_book a1 ON copies_book_id = book_id
	WHERE branch_name = 'Sharpstown' AND book_title = 'The Lost Tribe'
GO


--Drill 2
CREATE PROCEDURE usp_final_2
AS
SELECT b3.book_title, b2.branch_name, b1.copies_number FROM tbl_bookCopies b1
INNER JOIN tbl_book b3 ON copies_book_id = book_id
INNER JOIN tbl_branch b2 ON copies_branch_id = branch_id
WHERE book_title = 'The Lost Tribe'
GO


--Drill 3
CREATE PROCEDURE usp_final_3
AS
SELECT tbl_borrower.* FROM tbl_borrower
WHERE borrow_card_number not in(SELECT loans_card_number FROM tbl_bookLoans);
GO


--Drill 4
CREATE PROCEDURE usp_final_4 @Today INT
AS
SELECT d1.book_title, d2.borrow_name, d2.borrow_address FROM tbl_bookLoans d3
INNER JOIN tbl_book d1 ON loans_book_id = book_id
INNER JOIN tbl_borrower d2 ON loans_card_number = borrow_card_number
INNER JOIN tbl_branch ON loans_branch_id = branch_id
WHERE branch_name = 'Sharpstown' and d3.loans_date_due = @Today
GO


--Drill 5
CREATE PROCEDURE usp_final_5
AS
SET NOCOUNT ON
SELECT branch_name, COUNT(loans_book_id) AS books_loaned_out
FROM tbl_bookLoans
LEFT JOIN tbl_branch ON tbl_branch.branch_id = tbl_bookLoans.loans_branch_id
GROUP BY branch_name
GO


--Drill 6
CREATE PROCEDURE usp_final_6
AS
SET NOCOUNT ON
SELECT borrow_name, borrow_address, COUNT(tbl_bookLoans.loans_card_number) AS books_checked_out
FROM tbl_bookLoans
INNER JOIN tbl_borrower ON borrow_card_number = tbl_bookLoans.loans_card_number
GROUP BY borrow_name, borrow_address
HAVING COUNT(tbl_bookLoans.loans_card_number)> 5
GO


--Drill 7
CREATE PROCEDURE usp_final_7
AS
SELECT f1.book_title, f2.copies_number FROM tbl_book f1
INNER JOIN tbl_bookCopies f2 ON copies_book_id = copies_book_id
INNER JOIN tbl_bookAuthors f3 ON f1.book_id = author_book_id
INNER JOIN tbl_branch f4 ON f2.copies_branch_id = branch_id
WHERE author_name = 'Stephen King' AND branch_name = 'Central';
GO