-- =====================================================================
-- Database System Engineering and Distributed Backend Development
-- Course Code : 25CS1302E
-- Week        : 1
-- Title       : BookFlow - Schema Definition, Constraints and DDL
-- =====================================================================
-- Scenario
--   A local library tracks its books and members in a physical notebook.
--   Books get lost and there is no way to know who holds which book.
--   Build the SQL foundation for "BookFlow" so that every book has a
--   unique ISBN and no member can sign up without a unique email.
-- =====================================================================


-- ---------------------------------------------------------------------
-- STEP 1 : DATABASE SETUP
-- ---------------------------------------------------------------------

-- Query 1 : create the database.
-- IF NOT EXISTS makes the statement safe to re-run.
CREATE DATABASE IF NOT EXISTS bookflow_db;

-- Query 2 : make it the active database for this session.
USE bookflow_db;


-- ---------------------------------------------------------------------
-- STEP 2 : TABLE CREATION (DDL) WITH CONSTRAINTS
-- ---------------------------------------------------------------------

-- Query 3 : books table.
--   book_id        PRIMARY KEY  -> unique row identity (NOT NULL + UNIQUE)
--                  AUTO_INCREMENT -> MySQL generates 1, 2, 3, ...
--   title          NOT NULL     -> a book cannot be stored without a name
--   isbn           UNIQUE       -> no two books may share an ISBN
--                  VARCHAR      -> ISBNs keep leading zeros and ISBN-10 may end in 'X'
--   published_year CHECK        -> rejects future years (must be < 2027)
CREATE TABLE books (
    book_id        INT AUTO_INCREMENT PRIMARY KEY,
    title          VARCHAR(255) NOT NULL,
    isbn           VARCHAR(13)  NOT NULL UNIQUE,
    published_year INT,
    CONSTRAINT chk_published_year CHECK (published_year < 2027)
);

-- Query 4 : members table.
--   member_id  PRIMARY KEY     -> unique identity per member
--   full_name  NOT NULL        -> a member must have a name on record
--   email      NOT NULL UNIQUE -> no signup without an email, one account per email
CREATE TABLE members (
    member_id  INT AUTO_INCREMENT PRIMARY KEY,
    full_name  VARCHAR(100) NOT NULL,
    email      VARCHAR(150) NOT NULL UNIQUE
);

-- Query 5 : verify the schema.
-- Key = PRI proves the PRIMARY KEY, Key = UNI proves UNIQUE,
-- Null = NO proves NOT NULL.
DESCRIBE books;
DESCRIBE members;


-- ---------------------------------------------------------------------
-- STEP 3 : INITIAL SEEDING (VALID DATA)
-- ---------------------------------------------------------------------

-- Query 6 : insert 3 books.
-- book_id is omitted on purpose - AUTO_INCREMENT assigns 1, 2, 3.
INSERT INTO books (title, isbn, published_year) VALUES
('JAVA', '9780061122415', 1988),
('DBMS', '9780132350884', 2008),
('ML',   '9780735211292', 2018);

SELECT * FROM books;

-- Query 7 : insert 3 members, each with a distinct email.
INSERT INTO members (full_name, email) VALUES
('SUBBU ROY', 'subbusir@example.com'),
('SATEESH',   'sateesh@example.com'),
('KRISHNA',   'krishna@example.com');

SELECT * FROM members;


-- ---------------------------------------------------------------------
-- STEP 4 : CONSTRAINT TESTS (THESE MUST FAIL)
-- ---------------------------------------------------------------------
-- Each statement below deliberately violates one rule. A correct schema
-- rejects all four. The error message is the proof that data integrity
-- is actually enforced.

-- Test 1 : duplicate ISBN -> UNIQUE violation
-- Expected: ERROR 1062 (23000): Duplicate entry '9780061122415' for key 'books.isbn'
INSERT INTO books (title, isbn, published_year)
VALUES ('Fake Copy', '9780061122415', 2000);

-- Test 2 : NULL title -> NOT NULL violation
-- Expected: ERROR 1048 (23000): Column 'title' cannot be null
INSERT INTO books (title, isbn, published_year)
VALUES (NULL, '9999999999999', 2010);

-- Test 3 : future publication year -> CHECK violation
-- Expected: ERROR 3819 (HY000): Check constraint 'chk_published_year' is violated.
INSERT INTO books (title, isbn, published_year)
VALUES ('Time Traveler', '8888888888888', 2030);

-- Test 4 : duplicate email -> UNIQUE violation
-- Expected: ERROR 1062 (23000): Duplicate entry 'subbusir@example.com' for key 'members.email'
INSERT INTO members (full_name, email)
VALUES ('Subbu Clone', 'subbusir@example.com');

-- =====================================================================
-- END OF WEEK 1
-- =====================================================================
