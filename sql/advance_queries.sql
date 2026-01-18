--------------------     Advance Question  ----------------------------

-- 1-> Retrive the total number of books sold for each genre

Select b.genre,
	   Sum(o.quantity) As Total_book_sold
From books b
join orders o
on b.book_id=o.book_id
Group by b.genre;

-- 2-> Find the avg price of books in "Fantasy " genre

Select Avg(price) from books
where genre='Fantasy'

-- 3-> list customer who have placed at least 2 orders

Select customer_id,
	   count(order_id) as total_orders
from orders
Group by customer_id
having Count(order_id)>=2;
----	      

SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;

---	 
-- 4-> Find the most frequently ordered book

Select * from orders

Select book_id, Count(order_id) As order_count
From orders o
group by book_id
Order by order_count DESC limit 1;

--or  -- Find the most frequently ordered book with book namr

Select * from books;

Select b.title AS book_name,
	   o.book_id,COUNT(o.order_id) As order_count
From books b
join orders o
on b.book_id=o.book_id
Group by o.book_id,b.title
Order by order_count desc limit 1

-- 5- SHOW the top 3 most expensive books of 'Fantasy ' Genre

Select title,genre,price from books
Where genre='Fantasy'
order by price Desc limit 3;

-- 6-> Retrive the total quantity of books sold by each author;

Select * from books;
Select * from orders;

Select b.title,b.author,
	   SUM(o.quantity) As total_quantity_Sold,
	   Count(o.quantity)
from books b
join orders o
on b.book_id=o.book_id
Group BY b.author,b.title;

------------------------

-- 7-> List the cities where customers who spent over $30 are located

Select * from customers;
Select * from orders;

Select Distinct(c.city),c.name,
	   o.total_amount
from customers c
join orders o
on c.customer_id=o.customer_id
where o.total_amount>200

-- 8-> Find the customer who spent the most on orders

Select c.name,Sum(o.total_amount) As total_spent
from customers c
join orders o
on c.customer_id=o.customer_id
group by c.name
order by total_spent Desc;

-- 9-> Calculate the stock remaining stock fulfilling all orders;

SELECT 
    b.book_id,
    b.stock AS initial_stock,COALESCE(SUM(o.quantity), 0),
    b.stock - COALESCE(SUM(o.quantity), 0) AS remaining_stock
FROM books b
LEFT JOIN orders o
    ON b.book_id = o.book_id
GROUP BY b.book_id, b.stock;

-- 10-> order quantity is more than stock
SELECT 
    b.book_id,
    b.stock,
    SUM(o.quantity) AS total_ordered
FROM books b
JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id, b.stock
HAVING SUM(o.quantity) > b.stock;

