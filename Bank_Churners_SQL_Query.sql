select *
from [dbo].[BankChurners (1)]

EDA
--  1. Return a table having only graduates customers
select *
from [dbo].[BankChurners (1)]
where Education_Level = 'Graduate';

--  2. Return a table having only married customers
select *
from [dbo].[BankChurners (1)]
where Marital_Status = 'Married';

--  3. How many males customers are there
select count(Gender) as Total_Male_Customers
from [dbo].[BankChurners (1)]
where Gender = 'M';

--  4. How many Divorced Customers are there
select count(Marital_Status) as Total_Divorced_Customers
from [dbo].[BankChurners (1)]
where Marital_Status = 'Divorced';

--  5. Return a table of customers whose credit-limit is above 20,000 and order in descending order
select *
from [dbo].[BankChurners (1)]
where Credit_Limit > 20000
order by Credit_Limit DESC;

--  6. Return a table of customers who are Graduates and have a credit limit of above 20,000 and order the table
select *
from [dbo].[BankChurners (1)]
where Education_Level = 'Graduate' and Credit_Limit > 20000
order by Credit_Limit DESC;

--  7. Return a table of customers who are married, graduates, and have a Blue Card
select *
from [dbo].[BankChurners (1)]
where Marital_Status = 'Married' and Education_Level = 'Graduate' and Card_Category = 'Blue';

--  8. Return a table of existing customers whose total transaction amount is between
--  1,500 and 2000, and have at least 15,000 credit limit.
--  10. What is the lowest transaction amount ever transacted
--  11. Return the information of the customer with the highest transaction amount
--  12. Show the distribution of Gender in the dataset (Grouping)
--  13. Show the distribution of Education Level in the dataset and order in ascending order
--  (grouping and ordering)