-----Question 1

Library Management Database
Description
A MySQL database for a Library Management System, including tables for books, authors, members, loans, and a book-authors junction table. The SQL script includes constraints (PK, FK, NOT NULL, UNIQUE, CHECK) and sample data.
Files

library_management.sql: SQL script to create and populate the database.
ERD image.![Library Management Database ER](https://github.com/user-attachments/assets/05b4cd13-866e-4296-91aa-ec36c9b232c1)


Setup Instructions

Import the SQL script:mysql -u your_username -p < library_management.sql


Verify the database:USE library_management;
SHOW TABLES;
SELECT * FROM books;








--Question 2


Task Manager API
Description
This project is a simple Task Manager API built with Node.js, Express, and MySQL. It provides full CRUD (Create, Read, Update, Delete) functionality for managing tasks and categories. The database includes two tables: tasks and categories, with a one-to-many relationship.
Features

Create, read, update, and delete tasks
Associate tasks with categories
RESTful API endpoints
MySQL database integration

How to Run/Setup the Project
Prerequisites

Node.js (v16 or higher)
MySQL (v8 or higher)
Git

Setup Instructions

Clone the Repository:
git clone https://github.com/your-username/task-manager-api.git
cd task-manager-api


Install Dependencies:
npm install


Set Up MySQL Database:

Create a MySQL database named task_manager.
Import the task_manager.sql file:mysql -u your_username -p task_manager < task_manager.sql


Update the database configuration in src/config/db.js with your MySQL credentials (username and password).


Run the Application:
npm start

The API will be available at http://localhost:3000.


API Endpoints

GET /api/tasks - Retrieve all tasks
GET /api/tasks/:id - Retrieve a single task by ID
POST /api/tasks - Create a new task
PUT /api/tasks/:id - Update an existing task
DELETE /api/tasks/:id - Delete a task

Example Request (POST)
curl -X POST http://localhost:3000/api/tasks \
-H "Content-Type: application/json" \
-d '{"title":"New Task","description":"Task description","status":"pending","due_date":"2025-06-01","category_id":1}'

ERD (Entity-Relationship Diagram)



![Task Manager ERD](https://github.com/user-attachments/assets/bd1b6763-408c-4984-a751-8f961f7ea499)







Note: Replace the placeholder with a link to your actual ERD image after creating it using a tool like MySQL Workbench or draw.io.
Project Structure
task-manager-api/
├── src/
│   ├── config/
│   │   └── db.js
│   ├── routes/
│   │   └── tasks.js
│   └── index.js
├── task_manager.sql
├── package.json
└── README.md

