-- Creating database for Library Management System
CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- Creating table for Authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    birth_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating table for Books
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    publication_year INT NOT NULL,
    genre VARCHAR(50),
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_copies CHECK (available_copies <= total_copies)
);

-- Creating junction table for Books-Authors (Many-to-Many)
CREATE TABLE book_authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

-- Creating table for Members
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    join_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating table for Loans (Tracks book borrowing)
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    checkout_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    fine_amount DECIMAL(5,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE RESTRICT,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE RESTRICT,
    CONSTRAINT chk_dates CHECK (due_date >= checkout_date)
);

-- Inserting sample data into authors
INSERT INTO authors (first_name, last_name, email, birth_date) VALUES
('J.K.', 'Rowling', 'jkrowling@example.com', '1965-07-31'),
('George', 'Martin', 'gmartin@example.com', '1948-09-20'),
('Agatha', 'Christie', 'achristie@example.com', '1890-09-15');

-- Inserting sample data into books
INSERT INTO books (title, isbn, publication_year, genre, total_copies, available_copies) VALUES
('Harry Potter and the Philosopher''s Stone', '9780747532699', 1997, 'Fantasy', 5, 3),
('A Game of Thrones', '9780553103540', 1996, 'Fantasy', 4, 2),
('Murder on the Orient Express', '9780007119318', 1934, 'Mystery', 3, 1);

-- Inserting sample data into book_authors
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3);
-- Inserting sample data into members
INSERT INTO members (first_name, last_name, email, phone, join_date) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '2023-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2023-02-20'),
('Alice', 'Johnson', 'alice.j@example.com', '5555555555', '2023-03-10');

-- Inserting sample data into loans
INSERT INTO loans (book_id, member_id, checkout_date, due_date, return_date, fine_amount) VALUES
(1, 1, '2025-04-01', '2025-04-15', NULL, 0.00),
(2, 2, '2025-04-05', '2025-04-19', '2025-04-10', 0.00),
(3, 3, '2025-04-10', '2025-04-24', NULL, 0.00);