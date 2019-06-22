CREATE DATABASE db_library_final

USE db_library_final

CREATE TABLE tbl_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (5001,1),--to book_copies/branch_id
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL, -- to books/publisher_name
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),-- to book_authors/book_id
	book_title VARCHAR(50) NOT NULL, -- to book_loans/book_id
	book_publisher_name VARCHAR(50)  NOT NULL FOREIGN KEY REFERENCES tbl_publisher(publisher_name), -- from publisher/publisher_name
);

CREATE TABLE tbl_bookAuthors (
	author_book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id),--from book/book_id
	author_name VARCHAR(50) NOT NULL,
);


CREATE TABLE tbl_bookCopies  (
	copies_book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id), -- frombook/title
	copies_branch_id INT NOT NULL FOREIGN KEY REFERENCES tbl_branch(branch_id),-- from branch/branch_id
	copies_number INT NOT NULL
);

CREATE TABLE tbl_borrower (
	borrow_card_number INT PRIMARY KEY NOT NULL IDENTITY (10000,100), -- to book_loans/card_no
	borrow_name VARCHAR(50) NOT NULL,
	borrow_address VARCHAR(50) NOT NULL,
	borrow_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_bookLoans (
	loans_book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id), --from book/title
	loans_branch_id INT NOT NULL FOREIGN KEY REFERENCES tbl_branch(branch_id),--from branch/branch_id
	loans_card_number INT NOT NULL FOREIGN KEY REFERENCES tbl_borrower(borrow_card_number), -- from borrower/card_number
	loans_date_out INT NOT NULL,
	loans_date_due INT NOT NULL
);

INSERT INTO tbl_branch
	(branch_name, branch_address)
	VALUES 
	('central', '605 Linden Court'),
	('forrest', '250 West Yukon Dr.'),
	('east', '31 Leatherwood Street'),
	('sharpstown', '132 Mammoth St.')
;
SELECT * FROM tbl_branch;

INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES 
	('atom institue', '9208 Somerset Avenue', '239-555-2972'),
	('penguin international', '7470 Cambridge Ave.', '873-555-9201'),
	('sounds right', '338 Newcastle Dr.', '653-555-2817'),
	('academic writes', '8387A Thatcher Rd.', '320-555-2829'),
	('atlantic press', '98 Carriage Lane', '472-555-6728')
;
SELECT * FROM tbl_publisher;

INSERT INTO tbl_book
	(book_title, book_publisher_name)
	VALUES 
	('the lost tribe', 'penguin international'),
	('beans shadow', 'sounds right'),
	('the shannara way', 'atom institue'),
	('game of fire', 'academic writes'),
	('good fortune', 'atlantic press'),
	('all souls body', 'atom institue'),
	('elder scrolls', 'sounds right'),
	('player one saga', 'atom institue'),
	('breath of the wild', 'academic writes'),
	('ghosts of saltmarsh', 'academic writes'),
	('recursion', 'penguin international'),
	('outslider', 'atom institue'),
	('tomes of dragonfire', 'atlantic press'),
	('fellowship of earth', 'penguin international'),
	('three mind issue', 'atom institue'),
	('dunes of borg', 'academic writes'),
	('curse of ice', 'penguin international'),
	('hundred years of war', 'sounds right'),
	('sword of the fallen', 'atom institue'),
	('station eighty one', 'academic writes'),
	('obelisk gate', 'atom institue'),
	('shadows of the dead', 'academic writes')
;
SELECT * FROM tbl_book;

INSERT INTO tbl_bookAuthors
	(author_book_id, author_name)
	VALUES
	(1,'patricia tolk'),
	(2,'terry gailey'),
	(3,'deborah jemisn'),
	(4,'chelsea harkness'),
	(5,'patrick chi'),
	(6,'ted roth'),
	(7,'stephen king'),
	(8,'claudia forrest'),
	(9,'james adams'),
	(10,'patricia tolk'),
	(11,'micheal newman'),
	(12,'terry gailey'),
	(13,'patrick chi'),
	(14,'james adams'),
	(15,'stephen king'),
	(16,'chelsea harkness'),
	(17,'ted roth'),
	(18,'stephen king'),
	(19,'bell corey'),
	(20,'deborah jemisn'),
	(21,'terry gailey'),
	(22,'james adams')
;
SELECT * FROM tbl_bookAuthors;

INSERT INTO tbl_bookCopies
	(copies_book_id, copies_branch_id, copies_number)
	VALUES 
	(1,5001,5),
	(1,5002,2),
	(1,5003,1),
	(1,5004,9),
	(2,5001,4),
	(2,5002,3),
	(2,5004,7),
	(3,5001,1),
	(3,5002,10),
	(3,5003,1),
	(4,5002,6),
	(4,5003,1),
	(4,5004,3),
	(5,5001,1),
	(5,5002,8),
	(5,5004,4),
	(6,5001,6),
	(6,5004,11),
	(7,5001,3),
	(7,5002,2),
	(7,5003,1),
	(7,5004,9),	
	(8,5002,2),
	(8,5003,6),
	(8,5004,9),
	(9,5001,2),	
	(9,5003,1),
	(9,5004,9),
	(10,5001,3),
	(10,5002,6),
	(10,5003,3),
	(10,5004,7),
	(11,5001,10),
	(11,5002,2),
	(11,5004,4),
	(12,5001,5),
	(12,5002,6),
	(12,5003,20),
	(12,5004,6),
	(13,5002,1),
	(13,5003,5),
	(13,5004,9),
	(14,5001,3),
	(14,5002,7),
	(14,5004,2),
	(15,5001,5),
	(15,5002,2),
	(15,5004,3),
	(16,5004,5),
	(16,5002,9),
	(16,5003,7),
	(16,5004,3),
	(17,5004,5),
	(18,5003,2),
	(18,5004,1),
	(19,5001,0),
	(19,5002,2),
	(19,5004,10),
	(20,5003,11),
	(20,5002,9),
	(20,5003,2),
	(20,5004,3),
	(21,5002,6),
	(21,5004,1),
	(22,5004,12),
	(22,5002,9),
	(22,5004,3)
;
SELECT * FROM tbl_bookCopies;

INSERT INTO tbl_borrower
	(borrow_name, borrow_address, borrow_phone)
	VALUES 
	('harry bob', '7548 James St.', '325-555-9038'),
	('blake manning', '8821 Green Hill Drive', '325-555-6291'),
	('sarah irvine', '8579 Halifax St.', '325-555-2840'),
	('alex keyes', '922 Foster Rd.', '325-555-4281'),
	('scott hogan', '614 Piper Drive', '325-555-0938'),
	('ruth orson', '64 Forest Lane', '325-555-8763'),
	('victoria way', '8960 Jefferson St.', '325-555-6421'),
	('gerald rose', '551 Griffin Street', '325-555-5241'),
	('neil douglas', '280 Young Drive', '325-555-7642'),
	('adam gaiman', '7513 Meadow Ave.', '325-555-9821'),
	('kurt sanderson', '435 1st Ave.', '325-555-7972')
;
SELECT * FROM tbl_borrower;

INSERT INTO tbl_bookLoans
	(loans_book_id, loans_branch_id, loans_card_number, loans_date_out, loans_date_due)
	VALUES 
	(21, 5004, 10100, 20190401, 20191219),
	(4, 5003, 10600, 20190401, 20190711),
	(2, 5001, 10500, 20190402, 20191030),
	(7, 5004, 10100, 20190430, 20191011),
	(11, 5003, 10700, 20190523, 20191007),
	(18, 5003, 10800, 20190531, 20191128),
	(10, 5001, 10200, 20190607, 20190709),
	(12, 5002, 10600, 20190528, 20190912),
	(20, 5002, 10200, 20190521, 20190815),
	(2, 5001, 10400, 20190429, 20191216),
	(15, 5004, 10500, 20190515, 20190927),
	(13, 5003, 10700, 20190509, 20190702),
	(9, 5002, 10200, 20190506, 20191204),
	(8, 5001, 10800, 20190425, 20190926),
	(17, 5004, 11000, 20190501, 20191025),
	(13, 5003, 11000, 20190620, 20190625),
	(3, 5002, 10900, 20190619, 20190910),
	(1, 5001, 10800, 20190419, 20190802),
	(19, 5002, 10500, 20190417, 20191210),
	(16, 5001, 10400, 20190424, 20190716),
	(7, 5003, 10300, 20190507, 20190830),
	(9, 5004, 10600, 20190613, 20190724),
	(1, 5004, 10200, 20190618, 20190703),
	(2, 5004, 10800, 20190416, 20191120),
	(6, 5002, 10200, 20190403, 20190819),
	(18, 5003, 10100, 20190430, 20191011),
	(18, 5001, 10100, 20190523, 20191007),
	(15, 5003, 10700, 20190531, 20191128),
	(9, 5002, 10200, 20190607, 20190709),
	(6, 5001, 10500, 20190528, 20190912),
	(19, 5004, 10800, 20190521, 20190815),
	(16, 5002, 10900, 20190523, 20191007),
	(11, 5004, 10300, 20190531, 20191128),
	(10, 5002, 10200, 20190607, 20190709),
	(21, 5001, 10800, 20190528, 20190912),
	(22, 5003, 10700, 20190521, 20190815),
	(8, 5004, 10500, 20190429, 20191216),
	(7, 5001, 10100, 20190515 , 20190927),
	(12, 5001, 10400, 20190509, 20190702),
	(16, 5002, 10500, 20190506, 20191204),
	(11, 5003, 10700, 20190429, 20191216),
	(10, 5004, 10300, 20190618, 20190703),
	(20, 5003, 10200, 20190416, 20191120),
	(11, 5001, 10100, 20190403, 20190819),
	(12, 5003, 11000, 20190430, 20191011),
	(6, 5003, 10100, 20190523, 20191007),
	(3, 5002, 11000, 20190607, 20190709),
	(5, 5004, 10200, 20190528, 20190912),
	(10, 5004, 10300, 20190521, 20190815),
	(18, 5001, 10700, 20190429, 20191216),
	(2, 5001, 10800, 20190515 ,20190927),
	(14, 5002, 10400, 20190509, 20190702),
	(3, 5003, 10100, 20190506, 20191204)
;

SELECT * FROM tbl_bookLoans;