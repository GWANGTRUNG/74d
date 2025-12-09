CREATE TABLE Course (
                        id SERIAL PRIMARY KEY,
                        title VARCHAR(100),
                        instructor VARCHAR(50),
                        price NUMERIC(10,2),
                        duration INT
);

INSERT INTO Course (title, instructor, price, duration) VALUES
                                                            ('SQL Cơ bản', 'Nguyen A', 700000, 25),
                                                            ('Lập trình Python', 'Tran B', 1500000, 40),
                                                            ('SQL Nâng cao', 'Le C', 2000000, 35),
                                                            ('Web Backend Demo Project', 'Pham D', 800000, 20),
                                                            ('Phân tích dữ liệu với SQL', 'Hoang E', 1200000, 45),
                                                            ('Machine Learning', 'Vu F', 2500000, 50);

UPDATE Course
SET price = price * 1.15
WHERE duration > 30;

DELETE FROM Course
WHERE LOWER(title) LIKE '%demo%';

SELECT *
FROM Course
WHERE LOWER(title) LIKE '%sql%';

SELECT *
FROM Course
WHERE price BETWEEN 500000 AND 2000000
ORDER BY price DESC
LIMIT 3;
