CREATE DATABASE umuzi

CREATE TABLE customers (
    customerid SERIAL PRIMARY KEY,
    firstname varchar(50) NOT NULL,
    lastname varchar(50),
    gender varchar,
    address varchar(200),
    phone varchar(20),
    email varchar(100),
    city varchar(20),
    country varchar(50)
);

INSERT INTO customers (firstname, lastname, gender, address, phone, email, city, country) VALUES
('John', 'Hibert', 'Male', '284 chaucer st', '084789657', 'john@gmail.com', 'Johannesburg', 'South Africa'),
('Thando', 'Sithole', 'Female', '240 Sect 1', '0794445584', 'thando@gmail.com', 'Cape Town', 'South Africa'),
('Leon', 'Glen', 'Male', '81 Everton Rd Gillits', '0820832830', 'Leon@gmail.com', 'Durban', 'South Africa'),
('Charl', 'Muller', 'Male', '290A Dorset Ecke', '+44856872553', 'Charl.muller@yahoo.com', 'Berlin', 'Germany'),
('Julia', 'Stein', 'Female', '2 Wernerring', '+448672445058', 'Js234@yahoo.com', 'Frankfurt', 'Germany');

CREATE TABLE employees (
    employeeid SERIAL PRIMARY KEY,
    firstname varchar(50) NOT NULL,
    lastname varchar(50),
    email varchar(100),
    jobtitle varchar(20)
);

INSERT INTO employees (firstname, lastname, email, jobtitle) VALUES
('Kani', 'Matthew', 'mat@gmail.com', 'Manager'),
('Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk'),
('Gideon', 'Maduku', 'm@gmail.com', 'Accountant');


CREATE TABLE payments (
    customerid int,
    paymentid SERIAL PRIMARY KEY,
    paymentdate varchar NOT NULL,
    amount  numeric,
    currency varchar(4),
    FOREIGN KEY (customerid)
    REFERENCES customers(customerid)
);
INSERT INTO payments (customerid, paymentid, paymentdate, amount, currency) VALUES
(1, 1, '01-09-2018', 150.75, 'R'),
(5, 2, '03-09-2018',  150.75, 'R'),
(4, 3, '03-09-2018', 700.65, 'R');

CREATE TABLE products (
    productid SERIAL PRIMARY KEY,
    productname varchar(100),
    description varchar(300),
    buyprice numeric,
    currency varchar
);

INSERT INTO products (productname, description, buyprice, currency) VALUES
('Harley Davidson Chopper', 'This replica features working kickstand,front suspension gear-shift lever', 150.75, 'R'),
('Classic Car', 'Turnable front wheels,steering function', 550.75, 'R'),
('Sports car', 'Turnable front wheels,steering function', 700.60, 'R');

CREATE TABLE orders (
    orderid int,
    productid int,
    paymentid int,
    fulfilledbyemployeeid int,
    daterequired varchar,
    dateshipped varchar,
    status varchar(20),
    PRIMARY KEY (orderid),
    CONSTRAINT FK_ProductOrder
FOREIGN KEY (productid)
    REFERENCES products(productid),
CONSTRAINT FK_PaymentOrder
FOREIGN KEY (paymentid)
    REFERENCES payments(paymentid),
CONSTRAINT FK_EmployeeOrder
FOREIGN KEY (fulfilledbyemployeeid)
    REFERENCES employees(employeeid)
);

INSERT INTO orders (orderid, productid, paymentid, fulfilledbyemployeeid, daterequired, dateshipped, status) VALUES
(1, 1, 1, 2, '05-09-2018', '', 'Not shipped'),
(2, 1, 2, 2, '04-09-2018', '03-09-2018', 'Shipped'),
(3, 3, 3, 3, '06-09-2018', '', 'Not shipped');
