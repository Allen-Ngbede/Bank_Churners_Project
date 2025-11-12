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

--  8. Return a table of existing customers whose total transaction amount is between 1,500 and 2000, and have at least 15,000 credit limit.
select *
from [dbo].[BankChurners (1)]
where Total_Trans_Amt  between 1500 and 2000  
and Credit_Limit >= 15000
and Attrition_Flag = 'Existing Customer';

--  10. What is the lowest transaction amount ever transacted
select MIN(Total_Trans_Amt) as Lowest_Transaction_Amount
from [dbo].[BankChurners (1)]

--  11. Return the information of the customer with the highest transaction amount
select Top 1 *
from [dbo].[BankChurners (1)]
order by Total_Trans_Amt DESC

--  12. Show the distribution of Gender in the dataset (Grouping)
select Gender, COUNT(*) as Count_Gender,
  CAST(100.0 * COUNT(*) / SUM(COUNT(*)) over () as decimal (5,2)) as Percent_of_Total
from [dbo].[BankChurners (1)]
group by Gender
order by Count_Gender DESC;

--  13. Show the distribution of Education Level in the dataset and order in ascending order (grouping and ordering)
select Education_Level, COUNT(*) as Count_Eductaion_Level,
  CAST(100.0 * COUNT(*) / SUM(COUNT(*)) over () as decimal (5,2)) as Percent_of_Total
from [dbo].[BankChurners (1)]
group by Education_Level
order by Count_Eductaion_Level DESC;