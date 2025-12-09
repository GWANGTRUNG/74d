CREATE TABLE OrderInfo (
                           id SERIAL PRIMARY KEY,
                           customer_id INT,
                           order_date DATE,
                           total NUMERIC(10,2),
                           status VARCHAR(20)
);

INSERT INTO OrderInfo (customer_id, order_date, total, status)
VALUES
    (1, '2024-10-05', 350000, 'Completed'),
    (2, '2024-10-12', 750000, 'Pending'),
    (3, '2024-09-20', 1200000, 'Canceled'),
    (4, '2024-10-30', 450000, 'Completed'),
    (5, '2024-11-02', 980000, 'Processing');

SELECT *
FROM OrderInfo
WHERE total > 500000;

SELECT *
FROM OrderInfo
WHERE order_date >= '2024-10-01'
  AND order_date < '2024-11-01';

SELECT *
FROM OrderInfo
WHERE status <> 'Completed';

SELECT *
FROM OrderInfo
ORDER BY order_date DESC
LIMIT 2;
