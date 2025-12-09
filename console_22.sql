create database product_db;
create schema sale_schema;
set search_path to sale_schema;
CREATE TABLE Product (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(100),
                         category VARCHAR(50),
                         price NUMERIC(10,2),
                         stock INT
);
INSERT INTO Product (name, category, price, stock) VALUES
                                                       ('iPhone 15', 'Điện tử', 25000000, 10),
                                                       ('Laptop Dell XPS', 'Điện tử', 30000000, 5),
                                                       ('Bàn học gỗ', 'Nội thất', 1500000, 20),
                                                       ('Tai nghe Sony WH-1000XM5', 'Điện tử', 8000000, 15),
                                                       ('Nồi cơm điện Sharp', 'Gia dụng', 1200000, 25);
SELECT * FROM Product;
SELECT *
FROM Product
ORDER BY price DESC
LIMIT 3;

SELECT *
FROM Product
WHERE category = 'Điện tử'
  AND price < 10000000;

SELECT *
FROM Product
ORDER BY stock ASC;

