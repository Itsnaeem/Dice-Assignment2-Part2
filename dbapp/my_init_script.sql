-- Create a new database
CREATE DATABASE IF NOT EXISTS my_database;

-- Switch to the newly created database
USE my_database;

-- Create a sample table
CREATE TABLE IF NOT EXISTS my_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

-- Insert some sample data into the table
INSERT INTO my_table (name, age) VALUES
    ('John Doe', 30),
    ('Jane Doe', 25),
    ('Bob Smith', 35);
