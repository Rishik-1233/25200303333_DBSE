-- =====================================================================
-- Database System Engineering and Distributed Backend Development
-- Course Code : 25CS1302E
-- Week        : 2
-- Title       : The Librarian's Dashboard - JOINs, Aggregations,
--               Transactions and Indexing
-- =====================================================================
-- Scenario
--   The library is now digital. The head librarian needs a report showing
--   which members are active and which books are in the collection, plus a
--   "Book Donation" process where a new book is added and logged at the
--   exact same time - if one part fails, the whole process must stop.
-- =====================================================================


-- ---------------------------------------------------------------------
-- STEP 1 : CREATE DATABASE
-- ---------------------------------------------------------------------
CREATE DATABASE bookflow_db;
USE bookflow_db;


-- ---------------------------------------------------------------------
-- STEP 2 : BOOKS TABLE (DDL + CONSTRAINTS)
-- ---------------------------------------------------------------------
CREATE TABLE Books (
    book_id        INT PRIMARY KEY,
    title          VARCHAR(100) NOT NULL,
    isbn           VARCHAR(20) UNIQUE,
    published_year INT CHECK (published_year < 2027)
);


-- ---------------------------------------------------------------------
-- STEP 3 & 4 : INSERT BOOKS AND DISPLAY
-- ---------------------------------------------------------------------
INSERT INTO Books (book_id, title, isbn, published_year) VALUES
(1, 'The Great Gatsby',      '9780743273565', 1925),
(2, 'To Kill a Mockingbird', '9780061120084', 1960),
(3, '1984',                  '9780451524935', 1949);

SELECT * FROM Books;


-- ---------------------------------------------------------------------
-- STEP 5, 6 & 7 : MEMBERS TABLE - CREATE, INSERT, DISPLAY
-- ---------------------------------------------------------------------
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email     VARCHAR(100) UNIQUE
);

INSERT INTO Members (member_id, full_name, email) VALUES
(101, 'John Smith',    'john.smith@email.com'),
(102, 'Emma Wilson',   'emma.wilson@email.com'),
(103, 'Michael Brown', 'michael.brown@email.com');

SELECT * FROM Members;


-- ---------------------------------------------------------------------
-- STEP 8 : LOANS TABLE (JUNCTION TABLE WITH FOREIGN KEYS)
-- ---------------------------------------------------------------------
-- Loans records WHO borrowed WHICH book and WHEN. The foreign keys give
-- referential integrity - no loan can point at a member or a book that
-- does not exist.
CREATE TABLE Loans (
    loan_id   INT PRIMARY KEY,
    member_id INT,
    book_id   INT,
    loan_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id)   REFERENCES Books(book_id)
);


-- ---------------------------------------------------------------------
-- STEP 9 & 10 : INSERT 10 LOANS AND DISPLAY
-- ---------------------------------------------------------------------
INSERT INTO Loans (loan_id, member_id, book_id, loan_date) VALUES
(1,  101, 1, '2025-01-05'),
(2,  102, 2, '2025-01-08'),
(3,  103, 3, '2025-01-10'),
(4,  101, 2, '2025-02-01'),
(5,  102, 1, '2025-02-05'),
(6,  103, 2, '2025-02-12'),
(7,  101, 3, '2025-03-01'),
(8,  102, 3, '2025-03-07'),
(9,  103, 1, '2025-03-15'),
(10, 101, 1, '2025-04-01');

SELECT * FROM Loans;

-- Note: an insert such as member_id 999 would be rejected with
-- ERROR 1452 - a foreign key constraint fails.


-- ---------------------------------------------------------------------
-- STEP 11 : JOIN QUERY - WHO BORROWED WHAT
-- ---------------------------------------------------------------------
-- Loans stores only IDs. INNER JOIN pulls the readable full_name from
-- Members and title from Books using the ON conditions.
SELECT m.full_name AS Member_Name,
       b.title     AS Book_Title
FROM Loans l
INNER JOIN Members m ON l.member_id = m.member_id
INNER JOIN Books   b ON l.book_id   = b.book_id;


-- ---------------------------------------------------------------------
-- STEP 12 : GROUP BY QUERY - BOOKS PER YEAR
-- ---------------------------------------------------------------------
-- GROUP BY collapses rows sharing the same published_year into one group;
-- COUNT counts the books inside each group.
SELECT published_year,
       COUNT(book_id) AS Total_Books
FROM Books
GROUP BY published_year
ORDER BY published_year;


-- ---------------------------------------------------------------------
-- STEP 13-16 : DONATION VIA TRANSACTION (ATOMICITY)
-- ---------------------------------------------------------------------
CREATE TABLE Donation_History (
    donation_id   INT PRIMARY KEY,
    book_id       INT,
    donor_name    VARCHAR(100),
    donation_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- A donated book must appear in BOTH tables - never in just one.
-- START TRANSACTION groups the two inserts into a single atomic unit.
START TRANSACTION;

INSERT INTO Books (book_id, title, isbn, published_year)
VALUES (4, 'Animal Farm', '9780451526342', 1945);

INSERT INTO Donation_History (donation_id, book_id, donor_name, donation_date)
VALUES (1, 4, 'Raj Kumar', CURDATE());

COMMIT;
-- COMMIT saves both permanently. If anything had failed mid-way,
-- ROLLBACK would undo everything - this is the A (Atomicity) in ACID.


-- ---------------------------------------------------------------------
-- STEP 17 & 18 : INDEX ON ISBN + FAST SEARCH
-- ---------------------------------------------------------------------
CREATE INDEX idx_books_isbn ON Books(isbn);

SELECT * FROM Books WHERE isbn = '9780451524935';
-- Instead of scanning every row (full table scan), MySQL jumps straight
-- to the matching ISBN through a B-tree lookup. On 4 rows the difference
-- is invisible; on 4 million books it turns seconds into milliseconds.


-- ---------------------------------------------------------------------
-- FINAL STATE - DISPLAY ALL TABLES
-- ---------------------------------------------------------------------
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Loans;
SELECT * FROM Donation_History;

-- =====================================================================
-- END OF WEEK 2
-- =====================================================================
