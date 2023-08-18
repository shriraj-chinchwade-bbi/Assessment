Q. Print where order date contains 04
SELECT CustomerID,OrderDate FROM [Orders] where OrderDate LIKE '%04%'

Q. Print according to shipper id and customer id 
SELECT Orders.CustomerID,Customers.CustomerName,Orders.ShipperID,Shippers.ShipperID,Orders.OrderDate FROM [Orders],[Customers],[Shippers] where Orders.OrderDate LIKE '%04%'

Q. Display customers name and shipper name where orderDate is 04
SELECT Orders.CustomerID,Customers.CustomerName,Orders.ShipperID,Shippers.ShipperName,Orders.OrderDate FROM [Orders]join Customers on Orders.CustomerID=Customers.CustomerID JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID where Orders.OrderDate LIKE '%04%'

Q.print product NAME for product with second highest quantity 
1. SELECT OrderDetails.Quantity, Products.ProductName FROM [OrderDetails]join Products on OrderDetails.ProductID=Products.ProductID order by Quantity desc limit 1,1
2. SELECT MAX(OrderDetails.Quantity), Products.ProductName FROM [OrderDetails] join Products on OrderDetails.ProductID=Products.ProductID WHERE Quantity < (SELECT MAX(Quantity) FROM OrderDetails)

