/* ==============LIBRARY MANAGEMENT SYSTEM ============== */

-- Created by: Jeffrey Jenison
-- Created on: 2022-09-18

/* ============== CREATE AND POPULATE TABLES ============== */

-- Create database to store information
CREATE DATABASE lib_mgt_sys;

-- Create book dimension table
CREATE TABLE book_dim (
    `book_id` INT NOT NULL PRIMARY KEY,
    `title` VARCHAR(50) CHARACTER SET utf8,
    `author` VARCHAR(50) CHARACTER SET utf8,
    `pub_year` INT
);
INSERT INTO book_dim VALUES
    (1,'Pride and Prejudice','Jane Austen',1813),
    (2,'To Kill a Mockingbird','Harper Lee',1960),
    (3,'The Great Gatsby','F. Scott Fitzgerald',1925),
    (4,'One Hundred Years of Solitude','Gabriel Garcia Marquez',1967),
    (5,'In Cold Blood','Truman Capote',1965),
    (6,'Wide Sargasso Sea','Jean Rhys',1966),
    (7,'Brave New World','Aldous Huxley',1932),
    (8,'I Capture the Castle','Dodie Smith',1948),
    (9,'Jane Eyre','Charlotte Bronte',1847),
    (10,'Crime and Punishment','Fyodor Dostoevsky',1866),
    (11,'The Secret History','Donna Tartt',1992),
    (12,'The Call of the Wild','Jack London',1903),
    (13,'The Chrysalids','John Wyndham',1955),
    (14,'Persuasion','Jane Austen',1818),
    (15,'Moby-Dick','Herman Melville',1851),
    (16,'The Lion, The Witch and the Wardrobe','C.S. Lewis',1950),
    (17,'To the Lighthouse','Virginia Woolf',1927),
    (18,'The Death of the Heart','Elizabeth Bowen',1938),
    (19,'Tess of the d''Ubervilles','Thomas Hardy',1891),
    (20,'Frankenstein','Mary Shelley',1823);

-- Create Customer Dimension Table
CREATE TABLE IF NOT EXISTS cust_dim (
    `cust_id` INT NOT NULL PRIMARY KEY,
    `first_name` VARCHAR(32) CHARACTER SET utf8,
    `last_name` VARCHAR(32) CHARACTER SET utf8,
    `phone` VARCHAR(12) CHARACTER SET utf8,
    `loyalty` INT,
    `cust_address` VARCHAR(50) CHARACTER SET utf8,
    `cust_city` VARCHAR(32) CHARACTER SET utf8,
    `cust_state` VARCHAR(2) CHARACTER SET utf8,
    `cust_zip` INT(5)
);
INSERT INTO cust_dim VALUES
    (1,'Garry','Reed','578-094-3854',0,'7425 Oklahoma Drive','Farmingdale','NY',11735),
    (2,'Deanna','Wilson','116-007-4382',1,'9 Rosewood Street','Niles','MI',49120),
    (3,'Abigail','Harrison','837-270-5258',1,'8701 Thomas Road','Altoona','PA',16601),
    (4,'Darcy','Myers','151-771-1921',1,'83 Orange St.','Fort Mill','SC',29708),
    (5,'Carlos','Perkins','628-119-7450',0,'987 State Ave.','Garner','NC',27529),
    (6,'Elian','Cunningham','134-689-2280',0,'68 Brook Ave.','Pueblo','CO',81001),
    (7,'Cadie','Hamilton','685-387-8739',1,'8412 Birchwood Court','Columbia','MD',21044),
    (8,'Eric','Rogers','019-464-2043',1,'979 Euclid Drive','Duluth','GA',30096),
    (9,'Max','Richards','854-605-2775',0,'391 Hanover Dr.','Barrington','IL',60010),
    (10,'Daniel','Douglas','072-178-6242',1,'7888 East Sherman St.','Mobile','AL',36605),
    (11,'Max','Baker','363-943-0467',0,'30 Winding Way St.','Powell','TN',37849),
    (12,'Briony','Parker','644-083-7727',0,'7756 Wall St.','Gross Pointe','MI',48236),
    (13,'Rubie','Harris','562-465-5999',0,'8628 Illinois Ave.','Pasadena','MD',21122),
    (14,'Sawyer','Moore','234-846-1560',1,'33 NW. Elizabeth Dr.','Fishers','IN',46037),
    (15,'Ted','Hill','610-069-2061',0,'194 Cleveland Road','Helena','MT',59601);

-- Create Employee Dimensions Table
CREATE TABLE emp_dim (
    `emp_id` INT NOT NULL PRIMARY KEY,
    `employee_no` VARCHAR(6) CHARACTER SET utf8,
    `first_name` VARCHAR(32) CHARACTER SET utf8,
    `last_name` VARCHAR(32) CHARACTER SET utf8,
    `role` VARCHAR(32) CHARACTER SET utf8
);
INSERT INTO emp_dim VALUES
    (1,'S34567','Tilly','Vincent','Supervisor'),
    (2,'S47850','Becky','Krause','Librarian'),
    (3,'S15364','Kira','Hobbs','Librarian');

-- Create Borrowing History Table
CREATE TABLE IF NOT EXISTS transactions (
    `trans_id` INT NOT NULL PRIMARY KEY,
    `visit_id` INT,
    `trans_date` DATETIME,
    `cust_id` INT,
    `emp_id` INT,
    `book_id` INT
);
INSERT INTO transactions VALUES
    (0,1,'2008-04-26 20:28:00',13,1,12),
    (1,1,'2008-04-26 20:28:00',13,1,9),
    (2,2,'2008-01-16 19:50:00',8,2,5),
    (3,3,'2008-11-09 04:01:00',4,1,15),
    (4,6,'2008-05-20 03:54:00',8,1,9),
    (5,7,'2008-07-16 01:27:00',10,1,17),
    (6,7,'2008-07-16 01:27:00',10,1,5),
    (7,7,'2008-07-16 01:27:00',10,1,4),
    (8,10,'2008-04-05 22:04:00',8,2,12),
    (9,10,'2008-04-05 22:04:00',8,2,12),
    (10,10,'2008-04-05 22:04:00',8,2,12),
    (11,11,'2008-07-17 09:16:00',4,2,5),
    (12,11,'2008-07-17 09:16:00',4,2,14),
    (13,12,'2008-09-27 07:23:00',13,3,17),
    (14,13,'2008-10-04 12:59:00',8,3,12),
    (15,13,'2008-10-04 12:59:00',8,3,3),
    (16,13,'2008-10-04 12:59:00',8,3,15),
    (17,13,'2008-10-04 12:59:00',8,3,18),
    (18,14,'2008-07-09 00:06:00',15,3,12),
    (19,17,'2008-05-31 01:31:00',14,3,15),
    (20,17,'2008-05-31 01:31:00',14,3,18),
    (21,19,'2008-12-22 03:00:00',13,2,13),
    (22,21,'2008-12-30 21:43:00',2,3,2),
    (23,21,'2008-12-30 21:43:00',2,3,15),
    (24,22,'2008-02-16 20:48:00',6,1,14),
    (25,23,'2008-08-29 04:27:00',1,2,18),
    (26,23,'2008-08-29 04:27:00',1,2,16),
    (27,26,'2008-04-14 19:53:00',10,2,4),
    (28,26,'2008-04-14 19:53:00',10,2,10),
    (29,28,'2008-03-13 01:24:00',12,3,9),
    (30,33,'2008-02-16 17:33:00',13,1,5),
    (31,33,'2008-02-16 17:33:00',13,1,2),
    (32,33,'2008-02-16 17:33:00',13,1,13),
    (33,35,'2008-12-24 06:36:00',8,3,7),
    (34,37,'2008-02-23 22:18:00',11,1,4),
    (35,37,'2008-02-23 22:18:00',11,1,5),
    (36,37,'2008-02-23 22:18:00',11,1,0),
    (37,38,'2008-02-11 02:19:00',14,2,4),
    (38,39,'2008-12-14 23:05:00',3,2,12),
    (39,39,'2008-12-14 23:05:00',3,2,15),
    (40,42,'2008-06-29 19:54:00',14,1,6),
    (41,43,'2008-05-27 05:24:00',9,1,12),
    (42,44,'2008-03-09 09:41:00',7,3,12),
    (43,50,'2008-12-20 23:10:00',7,3,2),
    (44,50,'2008-12-20 23:10:00',7,3,17),
    (45,50,'2008-12-20 23:10:00',7,3,2),
    (46,50,'2008-12-20 23:10:00',7,3,15),
    (47,51,'2008-03-23 14:54:00',5,2,12),
    (48,51,'2008-03-23 14:54:00',5,2,15),
    (49,54,'2008-08-14 11:36:00',15,2,0),
    (50,54,'2008-08-14 11:36:00',15,2,12),
    (51,54,'2008-08-14 11:36:00',15,2,10),
    (52,54,'2008-08-14 11:36:00',15,2,12),
    (53,55,'2008-08-01 23:13:00',7,1,5),
    (54,57,'2008-11-20 23:54:00',5,1,3),
    (55,57,'2008-11-20 23:54:00',5,1,8),
    (56,59,'2008-08-30 11:59:00',8,3,10),
    (57,60,'2008-09-22 19:48:00',8,2,8);


/* ============== BASIC TABLE QUERIES ============== */

-- Full Transaction Table Combine
SELECT trans_id,
	trans_date,
    cust_dim.first_name,
    cust_dim.last_name,
    emp_dim.employee_no,
    book_dim.title,
    book_dim.author
FROM transactions

JOIN cust_dim
ON lib_mgt_sys.transactions.cust_id = lib_mgt_sys.cust_dim.cust_id

JOIN emp_dim
ON lib_mgt_sys.transactions.emp_id = lib_mgt_sys.emp_dim.emp_id

JOIN book_dim
ON lib_mgt_sys.transactions.book_id = lib_mgt_sys.book_dim.book_id;


-- Review Customer Transaction volume
SELECT CONCAT(cust_dim.first_name, ' ', cust_dim.last_name) AS customer,
	COUNT(trans_id) AS transactions
FROM transactions

JOIN cust_dim
ON transactions.cust_id = cust_dim.cust_id

GROUP BY customer
ORDER BY transactions DESC;