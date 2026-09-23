CREATE DATABASE RestaurantDB

CREATE TABLE Restaurant
(
    RID     INT          PRIMARY KEY,
    RName   VARCHAR(100) NOT NULL,
    Contact BIGINT       NOT NULL UNIQUE,
    Address VARCHAR(200) NOT NULL,
    Rating  DECIMAL(2,1) CHECK (Rating BETWEEN 0 AND 5),
    Type    VARCHAR(50)  NOT NULL
)

INSERT INTO Restaurant VALUES
(101, 'Spice Villa',   9908946138, 'Hyderabad',  4.7, 'Indian'),
(102, 'Royal Andhra',  9643182517, 'Vijayawada', 4.8, 'Andhra'),
(103, 'Tasty Hub',     9954983256, 'Chennai',    4.5, 'Chinese'),
(104, 'Green Bowl',    6305052457, 'Bangalore',  4.9, 'Vegetarian'),
(105, 'Food Palace',   7864318255, 'Mumbai',     4.6, 'Fast Food'),


CREATE TABLE Customer
(
    CID     INT          PRIMARY KEY,
    CName   VARCHAR(100) NOT NULL,
    Mobile  BIGINT       NOT NULL UNIQUE,
    Email   VARCHAR(100) UNIQUE,
    Address VARCHAR(200) NOT NULL
)

INSERT INTO Customer VALUES
(201, 'Arjun',  9925489512, 'arjun2026@gmail.com', 'Hyderabad'),
(202, 'Sneha',  9159875621, 'sneha2026@gmail.com', 'Vijayawada'),
(203, 'Ravi',   9865847625, 'ravi2026@gmail.com',  'Chennai'),
(204, 'Abhi',   9579842158, 'abhi2026@gmail.com',  'Mumbai'),
(205, 'Varun',  9579542644, 'varun2026@gmail.com', 'Bangalore'),
(206, 'Anjali', 9115789558, 'anjali2026@gmail.com','Delhi'),
(207, 'Rohit',  6904562154, 'rohit2026@gmail.com', 'Pune'),
(208, 'Pavan',  9584256712, 'pavan2026@gmail.com', 'Chennai'),
(209, 'Nikhil', 7335484212, 'nikhil2026@gmail.com','Hyderabad'),
(210, 'Divya',  9955845522, 'divya2026@gmail.com', 'Bangalore')

CREATE TABLE Payment
(
    PID      INT           PRIMARY KEY,
    Amount   DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    Type     VARCHAR(30)   NOT NULL,
    Date     DATE          NOT NULL,
    Discount DECIMAL(5,2)  DEFAULT 0 CHECK (Discount BETWEEN 0 AND 100)
)

INSERT INTO Payment VALUES
(301, 850.00,  'UPI',  '2026-01-15', 5.00),
(302, 1250.00, 'Card', '2026-02-20', 15.00),
(303, 720.00,  'Cash', '2026-03-12', 3.00),
(304, 1510.00, 'UPI',  '2026-04-18', 20.00),
(305, 950.00,  'Card', '2026-05-25', 5.00),
(306, 880.00,  'Cash', '2026-06-10', 8.00),
(307, 1900.00, 'UPI',  '2026-07-05', 25.00),
(308, 450.00,  'Card', '2026-07-22', 0.00),
(309, 1199.00, 'UPI',  '2026-08-03', 10.00),
(310, 790.00,  'Cash', '2026-08-10', 4.00)

CREATE TABLE Food
(
    FID      INT           PRIMARY KEY,
    FName    VARCHAR(100)  NOT NULL,
    Type     VARCHAR(50)   NOT NULL,
    Quantity INT           NOT NULL  CHECK (Quantity >= 0),
    Price    DECIMAL(10,2) NOT NULL CHECK (Price > 0)
)

INSERT INTO Food VALUES
(401, 'Mutton Biryani',      'Non-Veg', 30, 360.00),
(402, 'Veg Biryani',         'Veg',     45, 190.00),
(403, 'Chicken Noodles',     'Non-Veg', 35, 170.00),
(404, 'Veg Fried Rice',      'Veg',     40, 140.00),
(405, 'Mutton Curry',        'Non-Veg', 25, 399.00),
(406, 'Chicken Tikka',       'Non-Veg', 30, 240.00),
(407, 'Idli Sambar',         'Veg',     55, 90.00),
(408, 'Paneer Butter Masala','Veg',     28, 210.00),
(409, 'Veg Pizza',           'Veg',     35, 180.00),
(410, 'Chicken Pizza',       'Non-Veg', 30, 230.00)

CREATE TABLE Staff
(
    SID         INT          PRIMARY KEY,
    SName       VARCHAR(100) NOT NULL,
    Order_Count INT          DEFAULT 0 CHECK (Order_Count >= 0),
    Rating      DECIMAL(2,1) CHECK (Rating BETWEEN 0 AND 5),
    Position    VARCHAR(50)  NOT NULL
)

INSERT INTO Staff VALUES
(501, 'Ramesh', 130, 4.8, 'Manager'),
(502, 'sai',    100, 4.5, 'Chef'),
(503, 'Manoj',  115, 4.7, 'Waiter'),
(504, 'Ajay',   85,  4.3, 'Cashier'),
(505, 'Vijay',  105, 4.6, 'Chef')


SELECT * FROM Restaurant;
SELECT * FROM Customer;
SELECT * FROM Payment;
SELECT * FROM Food;
SELECT * FROM Staff;

1.
UPDATE Restaurant
SET Address='thirupati'
WHERE RID =101;
SELECT * FROM Restaurant
WHERE RID =101;
output=101	Spice Villa	9908946138	thirupati	4.7	Indian

2.
UPDATE Restaurant
SET Rating =4.9
WHERE RName='Royal Andhra';
SELECT * FROM Restaurant
WHERE RName='Royal Andhra';
output=102	Royal Andhra	9643182517	Vijayawada	4.9	Andhra

3.
 UPDATE Customer 
 SET Email ='abhi122026@gmail.com', Address ='thirupati'
 WHERE CName ='abhi';
 SELECT * FROM Customer
 WHERE CName ='abhi';
 output=204	Abhi	9579842158	abhi122026@gmail.com	thirupati

 4.
 UPDATE Food
 SET Quantity ='30'
 WHERE FID =405;
 SELECT * FROM Food
 WHERE FID =405;
 output=Mutton Curry	Non-Veg	30	399.00

 5.
 UPDATE Payment
 SET Discount ='15'
 WHERE PID =301;
 SELECT * FROM Payment
 WHERE PID =301;
 output=301	850.00	UPI	2026-01-15	15.00

 6.
 UPDATE Food
 SET Type ='fast food'
 WHERE FName ='veg pizza';
 SELECT * FROM Food
 WHERE FName ='veg pizza';
 output=409	Veg Pizza	fast food	35	180.00

 7.
 delete Food 
 where fname = 'Veg Biryani'
 select fname from Food 
 output=Mutton Biryani
        Chicken Noodles
        Veg Fried Rice
        Mutton Curry
        Chicken Tikka
        Idli Sambar
        Paneer Butter Masala
        Veg Pizza
        Chicken Pizza
 
8. 
delete Staff 
where SName ='Ajay' and Rating = 4.3
select SName from Staff
output=Ramesh
       sai
       Manoj
       Vijay

9.
update Restaurant 
set Type = 'Fast Food' 
where RID =103
select * from Restaurant 
where RID =103
output=103	Tasty Hub	9954983256	Chennai	4.5	Fast Food

10.
select RName 
from Restaurant 
where Type ='vegetarian'
output=Green Bowl

11.
select Contact 
from Restaurant 
where Address ='Vijayawada'
output=9643182517

12.
select * from Restaurant 
where Rating = 4.6
output=105	Food Palace	7864318255	Mumbai	4.6	Fast Food

13.
select Email 
from Customer 
where CID = 204
output=abhi122026@gmail.com

14.
select Price,Quantity 
from food
output=360.00	30
       170.00	35
       140.00	40
       399.00	30
       240.00	30
       90.00	55
       210.00	28
       180.00	35
       230.00	30
15.
select FName 
from Food 
where Type ='non-veg' and price > 299
output=Mutton Biryani
       Mutton Curry

16.
select Type 
from Payment 
where PID = 307
output=UPI

17.
update Staff 
set Position = 'Waiter'
where Rating > 4.7 and Order_Count >'102' 
select * from Staff 
where Rating > 4.7 and Order_Count >'102'
output=501	Ramesh	130	4.8	Waiter

18.
delete Staff 
where Rating <= 4.7 or Order_Count <='101'
select * from Staff
output=501	Ramesh	130	4.8	Waiter

19.
update Payment 
set Amount = 1199 , Discount = 20
where PID = 307
select * from payment  
where PID = 307
output=307	1199.00	UPI	2026-07-05	20.00

20.
delete Payment 
where PID = 303 and Type = 'Cash'
select * from Payment
output=302	1250.00	Card 2026-02-20	15.00
       304	1510.00	UPI	 2026-04-18	20.00
       305	950.00	Carh 2026-05-25	5.00
       306	880.00	Cash 2026-06-10	8.00
       307	1199.00	UPI	 2026-07-05	20.00
       308	450.00	Card 2026-07-22	0.00
       309	1199.00	UPI	 2026-08-03	10.00
       310	790.00	Cash 2026-08-10	4.00