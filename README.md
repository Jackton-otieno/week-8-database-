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

