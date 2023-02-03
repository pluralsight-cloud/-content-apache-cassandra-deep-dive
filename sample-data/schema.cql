CREATE KEYSPACE books WITH replication =
  {'class': 'SimpleStrategy', 'replication_factor' : 1};
CREATE TABLE books.books_by_title (
Book_id text,
Title text,
Author text,
Published_date date,
Publisher_id uuid,
Avaiable_copies smallint,
PRIMARY KEY ((book_id), title, published_date) )
WITH comment = 'Q1: Find books by title'
AND CLUSTERING ORDER BY (title asc, published_date DESC) ;
CREATE TABLE books.publishers (
Publisher_id uuid,
Name text,
Contact text,
PRIMARY KEY ((publisher_id), name) )
WITH comment = 'Q2: View Publisher information'
AND CLUSTERING ORDER BY (name DESC) ;
 
CREATE KEYSPACE checkout WITH replication =
  {'class': 'SimpleStrategy', 'replication_factor' : 1};
CREATE TABLE checkout.checkouts (
user_id uuid,
Date date,
Book_id text,
PRIMARY KEY ((user_id), date, book_id) )
WITH comment = 'Q3: Determine who last checked out a book'
AND CLUSTERING ORDER BY (date DESC, book_id asc) ;
CREATE TABLE checkout.users (
user_id uuid,
Name text,
Contact text,
PRIMARY KEY ((user_id), name) )
WITH comment = 'Q4: View user info'
AND CLUSTERING ORDER BY (name desc) ;

