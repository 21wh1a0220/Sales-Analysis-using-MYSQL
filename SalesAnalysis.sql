CREATE DATABASE COMPANY;
SELECT * FROM Sales;

 # Q1) Find all orders shipped via 'Economy' mode with a total amount greater than rs.25,000.
 SELECT * FROM Sales
 WHERE Ship_Mode = 'Economy' AND Total_Amount > 25000;
 
 #2) Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.
 SELECT * FROM Sales 
 WHERE category = 'Technology' AND country = 'Ireland' AND order_date > '2020-01-01';
 
 #3) List the top 10 most profitable sales transactions in descending order
 SELECT  *  FROM Sales
 ORDER BY Unit_Profit DESC
 LIMIT 10 ;    # top 10 transactions
 
 SELECT * FROM Sales
 ORDER BY Unit_Profit DESC
 LIMIT 10, 20; # skip 10 records, showing next 20 records
 
 #4) Find all customers whose name starts with 'J' and ends with 'n'
 SELECT Order_ID, Customer_name FROM Sales 
 WHERE Customer_name LIKE 'J%N';
 
  
 
 #5) Retreive all product names that contain 'Acco' anywhere in the name
 SELECT Order_ID , Product_name FROM Sales
 WHERE Product_name LIKE '%Acco%';
 
 #6) Get the top 5 cities with the highest total sales amount 
 
SELECT CITY, SUM(TOTAL_AMOUNT) as Highest_sales from sales
GROUP BY CITY
ORDER BY Highest_sales DESC
LIMIT 5;

#7) Display the second set of 10 records for Customer_Name and Total_Amount in decreasing order.
SELECT Customer_Name, Total_Amount FROM Sales
ORDER BY Total_Amount DESC
LIMIT 10,10;

#8) Find the total revenue, average unit cost, and total number of orders.
SELECT SUM(Total_Amount) AS 'total_revenue', 
       AVG(UNIT_COST) AS 'average unit cost',
       COUNT(ORDER_ID) AS 'total number of orders'
FROM SALES;

#9) Count unique number of regions.
SELECT COUNT(DISTINCT(Region)) as uniq_reg
FROM SALES;

#10) Find the number of orders placed by each customer 
SELECT Customer_Name , COUNT(Order_ID) AS Order_Count
FROM Sales
GROUP BY Customer_Name
ORDER BY Order_Count DESC;

#11) Rank 5 products based on total sales using RANK(). # Important question(interview), Types: Row number,rank,james rank,end type
SELECT Product_Name, SUM(Total_Amount) AS Total_Sales,
       RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Sales_Rank
FROM Sales
GROUP BY Product_Name
LIMIT 5;  



 