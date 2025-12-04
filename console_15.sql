CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          category VARCHAR(100),
                          price INT,
                          stock INT,
                          manufacturer VARCHAR(100)
);
INSERT INTO products (id, name, category, price, stock, manufacturer) VALUES
                                                                          (1, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
                                                                          (2, 'Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
                                                                          (3, 'Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
                                                                          (4, 'Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
                                                                          (5, 'iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
                                                                          (6, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
                                                                          (7, 'Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');


INSERT INTO products (name, category, price, stock, manufacturer)
VALUES ('Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');



UPDATE products
SET price = price * 1.10
WHERE manufacturer = 'Apple';

DELETE FROM products
WHERE stock = 0;



SELECT *
FROM products
WHERE price BETWEEN 1000000 AND 30000000;



SELECT *
FROM products
WHERE stock IS NULL;



SELECT DISTINCT manufacturer
FROM products;

SELECT *
FROM products
ORDER BY price DESC, name ASC;


SELECT *
FROM products
WHERE name ILIKE '%laptop%';



SELECT *
FROM products
ORDER BY price DESC, name ASC
LIMIT 2;
