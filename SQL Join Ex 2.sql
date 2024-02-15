/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 
 select products.name, categories.name
 from products
 Join categories on products.CategoryID = categories.CategoryID
 where categories.Name = "computers";

 
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 Select products.Name, products.Price, reviews.Rating
 from products
 join reviews on products.ProductID = reviews.ProductID
 where reviews.Rating = 5;
 
 
 
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- employeeID is shared key

select employees.FirstName, employees.LastName, sum(sales.Quantity) as "Total Sales"
from employees

left join sales on employees.EmployeeID = sales.EmployeeID
where sales.Quantity

group by employees.FirstName, employees.LastName
order by (sum(sales.Quantity)) desc;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
-- department and categories
-- 
select departments.Name, categories.Name
from departments
INNER JOIN categories on categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Name = "Games";


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, Sum(sales.Quantity) as "Total Sold", Sum(sales.Quantity * sales.PricePerUnit) as "Total Price"
from products
Inner Join sales on sales.ProductID = products.ProductID
where products.Name = "Eagles: Hotel California"; 



/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
from products
Inner join reviews on reviews.ProductID = products.ProductID
order by reviews.Rating
Limit 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */