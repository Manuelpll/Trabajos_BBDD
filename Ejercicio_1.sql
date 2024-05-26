create database ej1;
use ej1;
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ContactName VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50),
    PostalCode INT(5),
    Country VARCHAR(50)
);

INSERT INTO customer VALUES (1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57','Berlin',12209,'Germany');
INSERT INTO customer VALUES (2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222','México D.F.',5021,'Mexico');
INSERT INTO customer VALUES (3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312','México D.F.',5023,'Mexico');
INSERT INTO customer VALUES (4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.','London',11234,'UK');
INSERT INTO customer VALUES (5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8','Luleå',95822,'Sweden');

-- Insertar datos relevantes para consultas anteriores
INSERT INTO customer (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES 
    (30, 'Healthy Habits', 'Jessica Lee', '123 Wellness Street', 'Los Angeles', 90001, 'USA'),
    (31, 'Fresh Mart', 'David Johnson', '456 Green Avenue', 'Sydney', 2000, 'Australia'),
    (32, 'Tropical Fruits', 'Ana Silva', '789 Palm Road', 'Rio de Janeiro', 20000, 'Brazil'),
    (33, 'Café Arabica', 'Mohammed Ali', '10 Coffee Street', 'Cairo', NULL, 'Egypt'),
    (34, 'Tea House', 'Sakura Tanaka', '2 Tea Lane', 'Tokyo', 1600023, 'Japan'),
    (35, 'Juice Junction', 'Ravi Patel', '30 Orange Boulevard', 'Mumbai', 400001, 'India'),
    (36, 'Bakery Delights', 'Elena Rodriguez', '42 Baker Street', 'Madrid', 28001, 'Spain'),
    (37, 'Pizzeria Napoli', 'Giuseppe Russo', 'Via Napoli 5', 'Naples', 80100, 'Italy'),
    (38, 'Burger Bistro', 'William Turner', '123 Beef Avenue', 'New York', 10001, 'USA'),
    (39, 'Tandoori Nights', 'Arun Kumar', '456 Spicy Road', 'Delhi', 110001, 'India'),
    (40, 'Sushi Palace', 'Yuki Yamamoto', '7 Sushi Street', 'Osaka', 5300011, 'Japan'),
    (41, 'Thai Spice', 'Sara Nopparat', '123 Thai Avenue', 'Bangkok', 10100, 'Thailand'),
    (42, 'Mediterranean Grill', 'Dimitris Papadopoulos', '8 Olive Lane', 'Athens', 10563, 'Greece'),
    (43, 'Veggie Haven', 'Lucas Nguyen', '42 Green Road', 'Hanoi', 100000, 'Vietnam'),
    (44, 'Gourmet Bakes', 'Sophie Baker', '5 Bakery Street', 'Paris', 75002, 'France'),
    (45, 'Smoothie Paradise', 'Isabel Lopez', '123 Fruit Road', 'Los Angeles', 90001, 'USA'),
    (46, 'Steakhouse Deluxe', 'John Smith', '50 Meat Avenue', 'Chicago', 60601, 'USA'),
    (47, 'Seafood Galore', 'Emma White', '8 Fishermans Way', 'Sydney', 2000, 'Australia'),
    (48, 'Falafel Express', 'Ali Rahman', '123 Shawarma Street', 'Dubai', NULL, 'UAE'),
    (49, 'Curry House', 'Rajesh Sharma', '456 Masala Avenue', 'Mumbai', 400001, 'India');
   -- Ejercicio:
    select CustomerName,City from customer order by customerName asc;
    select distinct Country from customer where Country is not null;
    select CustomerName from customer where Country="Mexico";
    select ContactName,CustomerName from customer where Country="Germany" and City="Berlin";
    select ContactName,CustomerName from customer where not Country ="Germany"; -- Tambien se puede con !=
    select CustomerName from customer where CustomerName like "%Moreno%";
    select  CustomerName from customer where PostalCode is null;
    select CustomerName from customer order by City asc;
    select  * from customer order by CustomerName asc limit 3;
    select count(CustomerID) from customer;
    select count(City) from customer;
    select count( distinct Country) as Nºpaises from customer;