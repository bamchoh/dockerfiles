create role friend_books with createdb login password 'password';
create database friend_books owner friend_books;
create database friend_books_development owner friend_books;
create database friend_books_test owner friend_books;

