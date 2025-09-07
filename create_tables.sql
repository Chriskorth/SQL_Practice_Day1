CREATE TABLE IF NOT EXISTS patient_info(
patient_id SERIAL PRIMARY KEY,
full_name VARCHAR(100),
gender VARCHAR(10),
county VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS products(
product_id SERIAL PRIMARY KEY,
patient_id SERIAL REFERENCES patient_info(patient_id),
medicine_name VARCHAR(100) UNIQUE,
price FLOAT
);

CREATE TABLE IF NOT EXISTS sales(
sales_id SERIAL PRIMARY KEY,
product_id SERIAL REFERENCES products(product_id),
total_sales FLOAT
);

SELECT * FROM sales;

ALTER TABLE sales
ADD COLUMN patient_id SERIAL REFERENCES patient_info(patient_id)
;

INSERT INTO patient_info(full_name,gender,county)
VALUES 
('Brian Otieno','Male', 'Suffolk'),
('Faith Kwamboka', 'Female','Nassau'),
('Gilbert Mutua', 'Male', 'King');

SELECT * FROM patient_info;

INSERT INTO products(patient_id, medicine_name,price)
VALUES 
(1, 'Ny-quil', 25),
(2, 'Acetaminoph', 15),
(3, 'Paracetamol', 20),
(1, 'Insulin', 50.60),
(2, 'Cold', 5.99);

SELECT * FROM products;


INSERT INTO sales(product_id, patient_id, total_sales)
VALUES 
(1, 1, 150),
(2, 2, 100),
(3, 3, 60),
(2,3, 200.98);

SELECT * FROM SALES;
