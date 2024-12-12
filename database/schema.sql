DROP DATABASE IF EXISTS TaskManagementAppDatabase;

CREATE DATABASE TaskManagementAppDatabase;
USE TaskManagementAppDatabase;

CREATE TABLE categories (
                            id INTEGER PRIMARY KEY AUTO_INCREMENT,
                            name VARCHAR(255),
                            description TEXT,
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE tasks (
                       id INTEGER PRIMARY KEY,
                       text VARCHAR(255),
                       completed BOOLEAN,
                       due_date DATE,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                       category_id INTEGER,
                       FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE notes (
                       id INTEGER PRIMARY KEY,
                       text VARCHAR(255),
                       tasks_id INTEGER,
                       priority INTEGER,
                       category_id INTEGER,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                       FOREIGN KEY (tasks_id) REFERENCES tasks(id),
                       FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE users (
                       id INTEGER PRIMARY KEY,
                       name VARCHAR(255),
                       email VARCHAR(255) UNIQUE,
                       password VARCHAR(255),
                       notes_id INTEGER,
                       rank VARCHAR(255),
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                       last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       FOREIGN KEY (notes_id) REFERENCES notes(id)
);
