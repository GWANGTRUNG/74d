CREATE TABLE Customer (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(100),
                          email VARCHAR(100),
                          phone VARCHAR(20),
                          points INT
);
INSERT INTO Customer (name, email, phone, points)
VALUES
    ('Nguyen Van A', 'a@gmail.com', '0901111111', 120),
    ('Tran Thi B', 'b@gmail.com', '0902222222', 150),
    ('Le Van C', NULL, '0903333333', 80),           -- khách không có email
    ('Pham Thi D', 'd@gmail.com', '0904444444', 200),
    ('Hoang Van E', 'e@gmail.com', '0905555555', 95),
    ('Do Thi F', 'f@gmail.com', '0906666666', 170),
    ('Vo Van G', 'g@gmail.com', '0907777777', 200);

SELECT DISTINCT name
FROM Customer;

SELECT *
FROM Customer
WHERE email IS NULL;

SELECT *
FROM Customer
ORDER BY points DESC
OFFSET 1
    LIMIT 3;

SELECT *
FROM Customer
ORDER BY name DESC;
