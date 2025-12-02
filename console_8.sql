CREATE SCHEMA library;
CREATE TABLE library.Books (
                               book_id INT PRIMARY KEY,
                               title VARCHAR(255),
                               author VARCHAR(255),
                               published_year INT,
                               available BOOLEAN DEFAULT TRUE
);
CREATE TABLE library.Members (
                                 member_id INT PRIMARY KEY,
                                 name VARCHAR(255),
                                 email VARCHAR(255) UNIQUE,
                                 join_date DATE DEFAULT CURRENT_DATE
);
CREATE SCHEMA sales;
CREATE TABLE sales.Products (
                                product_id SERIAL PRIMARY KEY,
                                product_name VARCHAR(255),
                                price NUMERIC(10, 2),
                                stock_quantity INTEGER
);
CREATE TABLE sales.Orders (
                              order_id SERIAL PRIMARY KEY,
                              order_date DATE DEFAULT CURRENT_DATE,
                              member_id INTEGER,
                              CONSTRAINT fk_member
                                  FOREIGN KEY (member_id)
                                      REFERENCES library.Members(member_id)
);
CREATE TABLE sales.OrderDetails (
                                    order_detail_id SERIAL PRIMARY KEY,
                                    order_id INTEGER,
                                    product_id INTEGER,
                                    quantity INTEGER,
                                    CONSTRAINT fk_order
                                        FOREIGN KEY (order_id)
                                            REFERENCES sales.Orders(order_id),
                                    CONSTRAINT fk_product
                                        FOREIGN KEY (product_id)
                                            REFERENCES sales.Products(product_id)
);
ALTER TABLE library.Books
    ADD COLUMN genre VARCHAR(255);
ALTER TABLE library.Books
    RENAME COLUMN available TO is_available;
ALTER TABLE library.Members
    DROP COLUMN email;
DROP TABLE sales.OrderDetails;
