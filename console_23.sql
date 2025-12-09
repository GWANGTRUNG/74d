CREATE TABLE Employee (
                          id SERIAL PRIMARY KEY,
                          full_name VARCHAR(100),
                          department VARCHAR(50),
                          salary NUMERIC(10,2),
                          hire_date DATE
);
INSERT INTO Employee (full_name, department, salary, hire_date) VALUES
                                                                    ('Nguyen Van An', 'IT',        8000000, '2023-03-10'),
                                                                    ('Tran Thi Bich', 'HR',        7500000, '2023-07-22'),
                                                                    ('Le Hoang Nam', 'IT',         9000000, '2023-01-15'),
                                                                    ('Pham Bao An',  'Marketing',  5800000, '2022-12-20'),
                                                                    ('Do Minh Huy',  'Sales',      6100000, '2023-10-05'),
                                                                    ('Nguyen An Khang', 'IT',      12000000, '2023-05-30');


UPDATE Employee
SET salary = salary * 1.10
WHERE department = 'IT';

DELETE FROM Employee
WHERE salary < 6000000;

SELECT *
FROM Employee
WHERE full_name ILIKE '%an%';

SELECT *
FROM Employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';
