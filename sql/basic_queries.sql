--         BASIC QUERIES           --

-- 1-> Retrive all Books In the "Fiction" genre;

Select * From Books
Where genre='Fiction';

-- 2-> Find books Published after the yesr 1950

Select * From Books
Where published_year>1950;

-- 3-> List all customers from the Canada

Select * From customers
Where country='Canada';

-- 4-> Show order Placed in NOV 2023

Select * From orders
Where order_date between '01-11-2023' And '30-11-2023'

-- 5-> Retrive the total stock of book available

Select Sum(stock) as total_stock from books;

-- 6-> Find the details of most expernsive book

Select * From Books Order By PRICE Desc Limit 1;

-- 7-> Show all Customers who ordered more than 1 quantity of a book

Select c.name As Customer_name,
       o.quantity
from customers c
join
orders o
on c.customer_id=o.customer_id
where quantity>1;
	   
	   -- or
	   
Select * From orders
where quantity>1;

----------------------------------------------------

-- 8-> Retrive all orders where the total amount exceeds 200

Select * from orders
Where total_amount>200;

-- 9-> List all genre available in the books table

Select Distinct(genre) from books

-- 10-> Find the book with the lowest stock

Select * from books ORDER BY stock ASC LIMIT 1;

-- 11-> Calc the total revenue generated from all orders

Select Sum(total_amount) as Total_revenue from orders;

