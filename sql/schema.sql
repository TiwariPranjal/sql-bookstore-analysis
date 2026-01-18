Create Table Books(
Book_ID Serial Primary Key,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(50),
Published_year INT,
Price Numeric(10,2),
Stock INT
);

Create Table Customers(
Customer_ID Serial Primary Key,
Name VARCHAR(100),
Email VArchar(100),
Phone VArchar(15),
City VARCHAR(50),
Country VARCHAR(100)
);

Create Table Orders(
Order_Id Serial Primary Key,
Customer_Id INT References Customers(Customer_ID),
Book_ID INT References Books(Book_ID),
Order_Date Date,
Quantity INT,
Total_Amount Numeric(10,2)
);
