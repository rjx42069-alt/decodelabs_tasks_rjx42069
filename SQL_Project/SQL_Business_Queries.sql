#Query 1: Total Number of Orders
select count(*) as total_orders
from company.orders;
 
#Query 2: Product Distribution
select product,
count(*)as Number_of_Orders
from company.orders
group by product
order by Number_of_Orders desc;

#Query 3: Payment Method Distribution 
select paymentmethod,
count(*)as Number_of_Orders
from company.orders
group by PaymentMethod
order by Number_of_Orders desc;

#Query 4: Order Status Distribution
select orderstatus,
count(*) as Number_of_Orders
from company.orders
group by OrderStatus
order by Number_of_Orders desc;

#REVENUE ANALYSIS
#Query 5: Total Revenue
select sum(totalprice) as Total_Revenue
from company.orders;

#Query 6: Revenue By Product
select product,
sum(totalprice)as Revenue
from company.orders
group by Product
order by revenue desc;

#Query 7: Average Order Value
select avg(totalprice)as Average_Order_Value
from company.orders;

#Query 8: Revenue by Payment Method
select paymentmethod,
sum(totalprice)as Revenue
from company.orders
group by PaymentMethod
order by revenue desc;

#Query 9: Revenue by Referral Source
select referralsource,
sum(totalprice)as Revenue
from company.orders
group by ReferralSource
order by revenue desc;

#Query 10: Show all shipped orders
select*
from company.orders
where OrderStatus='Shipped';

#Query 11: Show all cancelled orders
select*
from company.orders
where OrderStatus='Cancelled';

#Query 12: Orders paid using Credit Card
select*
from company.orders
where PaymentMethod='Credit Card' ;

#Query 13: High value orders
select *
from company.orders
where TotalPrice>1000;

#Query 14: Orders where a coupon was used
select*
from company.orders
where CouponCode<>'';

#Query 15: Laptop orders
select*
from company.orders
where Product='Laptop';

#MORE BUSINESS INSIGHTS
#Query 16: Highest-priced products
select product,
max(`Unit Price`)as Highest_Unit_Price
from company.orders
group by Product
order by Highest_Unit_Price desc;

#Query 17: Average Quantity Ordered
select product,
avg(quantity) as Average_Quantity
from company.orders
group by Product
order by Average_Quantity desc;

#Query 18: Total Qauntity Sold
select Product,
sum(quantity) as Total_Quantity
from company.orders
group by Product
order by Total_quantity desc;

#Query 19: Monthly Revenue
select left(Date,7)as Month,
sum(totalprice) as Revenue
from company.orders
group by left(Date,7)
order by month;

#Query 20: Top 5 most expensive orders
select CustomerID,
Product,
TotalPrice
from company.orders
order by TotalPrice desc
limit 5;

#Query 21: Top 5 customers by spending 
select CustomerID,
sum(totalprice)as Total_Spent
from company.orders
group by CustomerID
order by Total_Spent desc
limit 5;

#Query 22:Average order value by payment method
select PaymentMethod,
avg(totalprice)as Average_Order_Value
from company.orders
group by PaymentMethod
order by Average_Order_Value desc;

#Query 23:Average order value by product
select Product,
avg(totalprice) as Average_Order_Value
from company.orders
group by Product
order by Average_Order_Value desc;

#Query 24: Number of orders per month
select left(Date,7)as Month,
count(*)as Number_of_Orders
from company.orders
group by left(date,7)
order by month;

#Query 25: Most popular coupon
select CouponCode,
count(*)as Times_Used
from company.orders
where CouponCode<>''
group by CouponCode
order by Times_Used desc;

#Query 26: Highest Revenue Product
select Product,
sum(totalprice)as Revenue
from company.orders
group by Product
order by Revenue desc
limit 1;

#Query 27: Large Orders
select*
from company.orders
where ItemsInCart>5;

#Query 28: Revenue by Order Status
select OrderStatus, 
sum(totalprice)as Revenue
from company.orders
group by OrderStatus
order by revenue desc;

#Query 29: Percentage of Orders Using Coupons
select 
round(count(case when CouponCode<>'' then 1 end)
*100.0/count(*),2)
as Coupon_Usage_Percentage
from company.orders;

#Query 30: Revenue by Year
select left(Date,4)as Year,
sum(totalprice)as Revenue
from company.orders
group by left(Date,4)
order by Year;