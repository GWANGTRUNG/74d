create schema order_schema;
set search_path to order_schema;

CREATE TABLE customers (
                           customer_id SERIAL PRIMARY KEY,
                           customer_name VARCHAR(100),
                           city VARCHAR(50)
);

CREATE TABLE orders (
                        order_id SERIAL PRIMARY KEY,
                        customer_id INT REFERENCES customers(customer_id),
                        order_date DATE,
                        total_amount NUMERIC(10,2)
);

CREATE TABLE order_items (
                             item_id SERIAL PRIMARY KEY,
                             order_id INT REFERENCES orders(order_id),
                             product_name VARCHAR(100),
                             quantity INT,
                             price NUMERIC(10,2)
);

SELECT
    c.customer_name AS ten_khach,
    o.order_date AS ngay_dat_hang,
    o.total_amount AS tong_tien
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id;

SELECT SUM(total_amount) AS tong_doanh_thu
FROM orders;

SELECT AVG(total_amount) AS trung_binh_don_hang
FROM orders;

SELECT MAX(total_amount) AS don_hang_lon_nhat
FROM orders;

SELECT MIN(total_amount) AS don_hang_nho_nhat
FROM orders;

SELECT COUNT(order_id) AS so_luong_don_hang
FROM orders;

SELECT
    c.city,
    SUM(o.total_amount) AS tong_doanh_thu
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city;

SELECT
    c.city,
    SUM(o.total_amount) AS tong_doanh_thu
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city
HAVING SUM(o.total_amount) > 10000;

SELECT
    c.customer_name AS ten_khach,
    o.order_date AS ngay_dat_hang,
    oi.product_name AS san_pham,
    oi.quantity AS so_luong,
    oi.price AS gia
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id
         JOIN order_items oi ON o.order_id = oi.order_id;

