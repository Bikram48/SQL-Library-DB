### **Library Management System Database Project**

The primary objective of this project is to develop a comprehensive and efficient database structure for a library management system. The system is designed to store, organize, and manage book-related data, including information about authors, categories, members, and transactions.

#### **Key Features **

- **Data Relationships:**  
  The schema follows a relational database approach with well-defined relationships between entities. This ensures data integrity and consistency, allowing for better management of one-to-many and many-to-many relationships between books, authors, categories, and members.

- **Data Analysis Using SQL Queries:**  
  The project includes the implementation of SQL queries and joins to analyze and extract meaningful insights from the database. Examples of analyses include:
  - List all the books that falls under the categories fantasy, nonfiction and fiction
  - Write a query to find the top 5 members who have borrowed the most books.
  - Write a SQL query to find the total number of times each book has been borrowed, along with the transaction dates, ordered by the total borrow count in descending order.
  - List the members who have returned books late along with the fine amount.
  - Find the books that have never been borrowed.
  - Find the books that have the same genre as another book.
  - Find all book titles in the Book table that contain the word "Harry" and "Game" anywhere in the title.
  - Write a SQL query to categorize books based on their genres and count how many books belong to each genre.
  - Count the number of books each author has written.
  - Write a SQL query to find books with limited availability (less than 5 copies) and categorize them based on their category.

#### **ER Diagram and Database Schema**

To ensure a well-structured system, the project includes an Entity-Relationship (ER) diagram that outlines the relationships between the main entities:

- **Book:** Stores information about the books in the library.
- **Author:** Maintains details about authors associated with books.
- **Category:** Categorizes books into genres or subjects.
- **Member:** Keeps track of registered library members.
- **Transaction:** Records borrowing and return activities.
- **Book_Author:** A junction table to handle the many-to-many relationship between books and authors.

#### **Data and Analysis**

- All the data inserted into the database is **dummy data** created for testing and demonstration purposes. No real library records have been used.
- SQL queries were executed to retrieve meaningful insights from this dummy dataset.

To see all the processes, designs, and detailed SQL queries used for analysis, please refer to the **PDF Report** included with this project.
