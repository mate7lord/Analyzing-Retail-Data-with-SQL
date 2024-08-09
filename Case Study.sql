-- 1. Top 3 customers based on orders
SELECT
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_order_amount
FROM Customers AS c
JOIN Orders AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_order_amount DESC
LIMIT 3;

-- 2. Average order value for each customer
SELECT 
    c.first_name,
    c.last_name,
    AVG(o.total_amount) AS average_order
FROM Customers AS c
JOIN Orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 3. Employee with more than 4 resolved support tickets
SELECT
    e.first_name,
    e.last_name,
    COUNT(s.ticket_id) AS resolved_tickets
FROM Employees AS e
JOIN SupportTickets AS s ON e.employee_id = s.employee_id
WHERE s.status = 'resolved'
GROUP BY e.employee_id, e.first_name, e.last_name
HAVING COUNT(s.ticket_id) > 4;

-- 4. Products that have never been ordered
SELECT
    p.product_name
FROM Products AS p
LEFT JOIN OrderDetails AS od ON p.product_id = od.product_id
WHERE od.order_id IS NULL;

-- 5. Total revenue
SELECT
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM OrderDetails AS od;

-- 6. Average price per product category where the average is greater than 500
WITH cte_avg_price AS (
    SELECT category, AVG(price) AS rerata
    FROM Products
    GROUP BY category
)
SELECT * FROM cte_avg_price 
WHERE rerata > 500;

-- 7. Customers with orders over 1000
SELECT
    c.*
FROM Customers AS c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM Orders AS o
    WHERE o.total_amount > 1000
);
