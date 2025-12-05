create database product_db;
create schema sale_schema;
set search_path to sale_schema;
create table products(
    productid serial primary key ,
    productname varchar (100),
    category varchar(50)
);

create table orders (
    orderid serial primary key ,
    productid serial references products(productid),
    quantity int ,
    total_price int
);
INSERT INTO products (productid, productname, category)
VALUES
    (1, 'Laptop Dell', 'Electronics'),
    (2, 'IPhone 15', 'Electronics'),
    (3, 'Bàn học gỗ', 'Furniture'),
    (4, 'Ghế xoay', 'Furniture');
INSERT INTO orders (orderid, productid, quantity, total_price)
VALUES
    (101, 1, 2, 2200),
    (102, 2, 3, 3300),
    (103, 3, 5, 2500),
    (104, 4, 4, 1600),
    (105, 1, 1, 1100);

select p.category,
       sum(o.total_price) as total_sales,
       sum(o.quantity)as total_quantity
from products p
join orders o on p.productid = o.productid
group by p.category
having sum (o.total_price)>2000
order by  total_sales DESC;

SELECT
    p.productname,
    total_revenue
FROM products p
         JOIN (
    SELECT
        productid,
        SUM(total_price) AS total_revenue
    FROM orders
    GROUP BY productid
    ORDER BY total_revenue DESC
    LIMIT 1
) AS t ON p.productid = t.productid;


SELECT
    p.category,
    SUM(o.total_price) AS total_sales
FROM products p
         JOIN orders o ON p.productid = o.productid
GROUP BY p.category;


-- Tập 1: Category chứa product doanh thu cao nhất
SELECT category
FROM products
WHERE productid = (
    SELECT productid
    FROM orders
    GROUP BY productid
    ORDER BY SUM(total_price) DESC
    LIMIT 1
)

INTERSECT

-- Tập 2: Category có tổng doanh thu > 3000
SELECT
    p.category
FROM products p
         JOIN orders o ON p.productid = o.productid
GROUP BY p.category
HAVING SUM(o.total_price) > 3000;


