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


--  14. What gender is most divorced
select Gender, COUNT(*) as Count_of_Divorced
from [dbo].[BankChurners (1)]
where Marital_Status = 'Divorced'
group by Gender 
order by Count_of_Divorced DESC;

--  15. Of all existing customers who has a credit limit above 15,000, what marital status has the most number of dependent
select Marital_Status, COUNT(Dependent_count) as Count_of_Dependent
from [dbo].[BankChurners (1)]
where Credit_Limit > 15000 and Attrition_Flag= 'Existing Customer'
group by Marital_Status
order by Count_of_Dependent DESC;

--  16. What is the total revolving balance of customers who are youths (assuming youths are people within the age of 30- 40)
select SUM(Total_Revolving_Bal) as Youth_Total_Revolving_Bal
from [dbo].[BankChurners (1)]
where Customer_Age BETWEEN 30 and 40;

--  17. What education level of customers has the most number of people depending on them.
select Education_Level, SUM(Dependent_count) as Sum_of_Dependent
from [dbo].[BankChurners (1)]
group by Education_Level
order by Sum_of_Dependent DESC;

--  18. What is the total of credit limit of all existing graduate customers
select Education_Level, SUM(Credit_Limit) as Total_Credit_Limit
from [dbo].[BankChurners (1)]
where Attrition_Flag= 'Existing Customer' and Education_Level = 'Graduate'
group by Education_Level;

--  19. Of all Attrited Male Married customers, what education level makes the most average total transaction
select  TOP 1 Education_Level, AVG(Total_Trans_Amt) as Average_Trans_Amt
from [dbo].[BankChurners (1)]
where Attrition_Flag= 'Attrited Customer' and Gender = 'M'
group by Education_Level
Order by Average_Trans_Amt DESC;

--  20. Credit Limit shows the income level of customers. Classify the customers according to their income level 
-- (Low Income, Average Income, High Income, and Elite)
select CLIENTNUM, Credit_Limit,
    CASE 
        WHEN Credit_Limit <= 2000 THEN 'Low Income'
        WHEN Credit_Limit BETWEEN 2001 AND 5000 THEN 'Average Income'
        WHEN Credit_Limit BETWEEN 5001 AND 10000 THEN 'High Income'
        WHEN Credit_Limit > 10000 THEN 'Elite'
        ELSE 'Unknown'
    END AS Income_Level
from [dbo].[BankChurners (1)];

--  21. Is it true that as females get more educated, they are more likely to get divorced ?
SELECT Education_Level, COUNT(*) AS Total_Divorced_Females
FROM [dbo].[BankChurners (1)]
WHERE Gender = 'F'
  AND Marital_Status = 'Divorced'
GROUP BY Education_Level
ORDER BY Total_Divorced_Females DESC;

--  24. What is the average credit limit of all Male customers
select ROUND( AVG(Credit_Limit),1) as Avg_Credit_Limit_Male
from [dbo].[BankChurners (1)]
where Gender = 'M';

