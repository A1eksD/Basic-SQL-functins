-- GET 
-- all customers from the "Customers" table, sorted by CustomerName in ascending order(decending order = DESC).
SELECT * FROM Customers ORDER BY CustomerName ASC; 


-- ADD 
-- new data to the "Employees" table.
INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, Photo, Notes)
VALUES ("1", "Max", "Mustermann", "1900-01-01", "EmpID1.pic", "Hallo World")


-- DELETE
DROP TABLE Employees;


-- UPDATE
UPDATE Employees SET FirstName = "Juan" WHERE EmployeeID = 1;


-- FILTER 
-- get customers from the "Customers" table who live in the city "Berlin"
SELECT * FROM Customers WHERE City = "Berlin"; -- filter 1 value
SELECT * FROM Customers WHERE City IN ("Berlin", "Madrid"); -- filter 2 values
SELECT * FROM Customers WHERE ContactName LIKE "Maria%"; -- filter one part of a value
SELECT * FROM Customers WHERE PostalCode LIKE "0%" AND Country="Mexico"; -- combination of both filters


-- COMBINE
-- get all customers and their orders
SELECT * FROM Orders LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID WHERE ContactName="Max Mustermann"; -- get a customer and his orderdetails
SELECT * FROM (Orders LEFT JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID) LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID; -- get all customers and their orderdetails
SELECT OrderDate, ProductName, Quantity FROM (Orders LEFT JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID) LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID; -- get just some data


-- CREATE NEW TABLE
-- create a new table called "ProductOrders"
SELECT OrderDate, ProductName, Quantity, Price INTO ProductOrders FROM (Orders LEFT JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID) LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID


/*
MATHEMATIACL FUNCTIONS
* = Quantity * Price --> Quantity * Price AS Total
/ = Total / Quantity --> (Quantity * Price) / Quantity AS AvgPricePerItem
+ = Total + Quantity --> (Quantity * Price) + 5 AS TotalWithShipping
- = Total - Quantity --> Price - 2 AS DiscountedPrice
*/
SELECT OrderDate, ProductName, Quantity, Price, Quantity * Price AS Total 
INTO ProductOrders FROM (Orders LEFT JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID) 
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE OrderDate LIKE "1996%"; -- starts with 1996 | or WHERE YEAR(OrderDate) = 1996; | WHERE OrderDate LIKE "*1996"; (ends with 1996)

SELECT COUNT(Quantity * Price) AS Orders, SUM(Quantity * Price) AS Total,  AVG(Quantity * Price) AS Avarage -- count, total and average sum of all orders
INTO ProductOrders FROM (Orders LEFT JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID) 
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE OrderDate LIKE "1996%"; 

