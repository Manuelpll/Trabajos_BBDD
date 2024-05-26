CREATE database IF NOT EXISTS ejercicio2;
use Ejercicio2

CREATE TABLE customer (
    CustomerID	INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ContactName	VARCHAR(50),
    Address	VARCHAR(50),
    City VARCHAR(50),
    PostalCode INT,
    Country VARCHAR(50)
);
insert into customer (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country)
values(1,"Alfreds Futterkiste","Maria Anders","Obere Str. 57","Berlin",12.209,"Germany")
insert into customer (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country)
values(2,"Ana Trujillo Emparedados y helados","Ana Trujillo","Avda. de la Contitución 2222","México D.F",15.021,"México")
insert into customer (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country)
values(3,"Antonio Moreno Taqueria","Antonio Moreno","Mataderos 2312","México D.F.",5.023,"México")
update customer set Address="Plz. de la Iglesia, 2390" where CustomerID=1
update customer  set PostalCode=282925 where CustomerID=1
update customer set City="Frankfurt" where CustomerID=1
update customer  set ContactName="Amancio Ortega"where CustomerID=2
update customer  set ContactName="Amancio Ortega"where CustomerID=3
update customer  set ContactName="M-Amancio Ortega"where CustomerID=3
update customer  set ContactName="M-Amancio Ortega"where CustomerID=2


