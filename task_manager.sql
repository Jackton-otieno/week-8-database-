-- Creating database for Task Manager
CREATE DATABASE IF NOT EXISTS task_manager;
USE task_manager;

-- Creating table for Categories
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating table for Tasks
CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    status ENUM('pending', 'in_progress', 'completed') DEFAULT 'pending',
    due_date DATE,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

-- Inserting sample data into categories
INSERT INTO categories (name, description) VALUES
('Work', 'Tasks related to professional duties'),
('Personal', 'Tasks for personal growth or errands'),
('Urgent', 'High-priority tasks');

-- Inserting sample data into tasks
INSERT INTO tasks (title, description, status, due_date, category_id) VALUES
('Complete Project Proposal', 'Draft and submit proposal for client X', 'in_progress', '2025-05-15', 1),
('Grocery Shopping', 'Buy weekly groceries', 'pending', '2025-05-10', 2),
('Fix Bug in API', 'Resolve issue in authentication endpoint', 'in_progress', '2025-05-08', 3);