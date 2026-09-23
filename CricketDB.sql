create database CricketDB

use CricketDB

create table Player
(
    pid     int         primary key,
    pname   varchar(50) not null,
    Age     int         not null,
    Gender  varchar(10),
    Role    varchar(20),
    Country varchar(30)
)
insert into Player values
(1, 'Rohit Sharma',      39, 'Male', 'Batsman',      'India'),
(2, 'Virat Kohli',       38, 'Male', 'Batsman',      'India'),
(3, 'Shubman Gill',      25, 'Male', 'Batsman',      'India'),
(4, 'Dewald Brevis',     23, 'Male', 'Batsman',      'South Africa'),
(5, 'David Warner',      29, 'Male', 'Batsman',      'Australia'),
(6, 'Jasprit Bumrah',    32, 'Male', 'Bowler',       'India'),
(7, 'Jofra Archer',      31, 'Male', 'Bowler',       'England'),
(8, 'Rashid Khan',       27, 'Male', 'Bowler',       'Afghanistan'),
(9, 'Sanju Samson',      29, 'Male', 'Wicketkeeper', 'India'),
(10, 'Suryakumar Yadav', 35, 'Male', 'Batsman',      'India'),
(11, 'kieron Pollard',   39, 'Male', 'All-rounder',  'West Indies'),
(12, 'Kane Williamson',  34, 'Male', 'Batsman',      'New Zealand')

create table Team
(
    tid     int         primary key,
    tname   varchar(50) not null,
    Country varchar(30),
    Coach   varchar(50),
    Ranking int
)
insert into Team values
(101, 'India',       'India',       'Rahul Dravid',     1),
(102, 'Australia',   'Australia',   'Andrew McDonald',  3),
(103, 'England',     'England',     'Brendon McCullum', 4),
(104, 'Pakistan',    'Pakistan',    'Gary Kirsten',     8),
(105, 'New Zealand', 'New Zealand', 'Gary Stead',       5),
(106, 'Afghanistan', 'Afghanistan', 'Jonathan Trott',   6)

create table Match
(
    mid      int primary key,
    tid1     int,
    tid2     int,
    mdate    date,
    Venue    varchar(100),
    mtype    varchar(20),
    winnerid int,
    foreign key (tid1) references Team(tid),
    foreign key (tid2) references Team(tid),
    foreign key (winnerid) references Team(tid)
)
insert into Match values
(201, 101, 102, '2026-01-10', 'Rajiv Gandhi Stadium',     'T20', 101),
(202, 101, 103, '2026-01-15', 'Wankhede Stadium',         'ODI', 101),
(203, 102, 104, '2026-02-05', 'Melbourne Cricket Ground', 'T20', 102),
(204, 101, 105, '2026-02-15', 'Eden Gardens',             'ODI', 105),
(205, 104, 105, '2026-03-01', 'Gaddafi Stadium',          'T20', 104),
(206, 101, 106, '2026-03-10', 'Arun Jaitley Stadium',     'T20', 101)

create table PlayerPerformance
(
    Perfid  int primary key,
    mid     int,
    pid     int,
    Runs    int,
    Wickets int,
    Catches int,
    foreign key (mid) references Match(mid),
    foreign key (pid) references Player(pid)
)
insert into PlayerPerformance values
(301, 201, 1, 85,  0, 2),
(302, 202, 1, 150, 0, 1),
(303, 201, 2, 72,  0, 1),
(304, 203, 2, 110, 0, 2),
(305, 202, 3, 35,  0, 1),
(306, 204, 3, 68,  0, 0),
(307, 201, 4, 90,  0, 1),
(308, 205, 4, 55,  0, 1),
(309, 202, 5, 75,  0, 1),
(310, 206, 5, 60,  0, 0),
(311, 201, 6, 12,  3, 0),
(312, 203, 6, 8,   2, 1),
(313, 202, 7, 5,   4, 0),
(314, 204, 7, 7,   2, 1),
(315, 203, 8, 3,   3, 0),
(316, 205, 8, 6,   2, 1),
(317, 204, 9, 65,  0, 3),
(318, 206, 9, 20,  0, 2),
(319, 205, 10,80,  0, 2),
(320, 206, 10,40,  0, 1),
(321, 205, 11,70,  0, 1),
(322, 206, 11,45,  2, 0),
(323, 204, 12,95,  0, 1),
(324, 206, 12,35,  0, 1)

create table Matchofficial
(
    oid     int primary key,
    oname   varchar(50),
    Role    varchar(30),
    Country varchar(30),
    mid     int,

    foreign key (mid) references Match(mid)
)
insert into Matchofficial values
(401, 'Richard Kettleborough', 'Umpire', 'England',     201),
(402, 'Kumar Dharmasena',      'Umpire', 'Sri Lanka',   202),
(403, 'Aleem Dar',             'Umpire', 'Pakistan',    203),
(404, 'Joel Wilson',           'Umpire', 'West Indies', 204),
(405, 'Chris Gaffaney',        'Umpire', 'New Zealand', 205),
(406, 'Nitin Menon',           'Umpire', 'India',       206)

create table Payment
(
    payid   int primary key,
    bid     int,
    Amount  decimal(10,2),
    Pmode   varchar(30),
    Pstatus varchar(30)
)
insert into Payment values
(501, 601, 500.00, 'UPI',        'Success'),
(502, 602, 750.00, 'Card',       'Success'),
(503, 603, 1200.00,'UPI',        'Success'),
(504, 604, 1500.00,'Net Banking','Success'),
(505, 605, 450.00, 'Card',       'Pending'),
(506, 606, 900.00, 'UPI',        'Success'),
(507, 607, 600.00, 'Cash',       'Success'),
(508, 608, 1800.00,'Card',       'Success')

select * from Player
select * from Team
select * from Match
select * from PlayerPerformance
select * from Matchofficial
select * from Payment


1.
select pname, Country from Player
where Role = 'Batsman' and Age > 25
output:
Rohit Sharma	India
Virat Kohli	India
David Warner	Australia
Suryakumar Yadav	India
Kane Williamson	New Zealand

2.
select pname from Player
where (Country = 'India' or Country = 'Australia') and Age < 30
output:
Shubman Gill
David Warner
Sanju Samson

3.
select * from Team
where Ranking <= 10 and Country = 'India'
output:
101	India	India	Rahul Dravid	1

4.
select mid, Venue, mtype from Match
where mtype = 'T20' and Venue = 'Rajiv Gandhi Stadium'
output:
201	Rajiv Gandhi Stadium	T20

5.
select pid, Runs, Wickets from PlayerPerformance
where Runs > 50 or Wickets > 2
output:
1	85	0
1	150	0
2	72	0
2	110	0
3	68	0
4	90	0
4	55	0
5	75	0
5	60	0
6	12	3
7	5	4
8	3	3
9	65	0
10	80	0
11	70	0
12	95	0

6.
select distinct Country from Player
output:
Afghanistan
Australia
England
India
New Zealand
South Africa
West Indies

7.
select distinct mtype from Match
output:
ODI
T20

8.
select pname from Player
where pname like 'S%' and Country = 'India'
output:
Shubman Gill
Sanju Samson
Suryakumar Yadav

9.
select count(*) from Player
where Country = 'India'
output:6

10.
select max(Runs) from PlayerPerformance
output:150

11.
select avg(Runs) from PlayerPerformance
where Runs > 20
output:72

12.
select sum(Wickets) from PlayerPerformance
output:18

13.
select min(Catches), max(Catches), avg(Catches) from PlayerPerformance
output:0	3	1

14.
select Role, count(*) from Player
where Age > 25 group by Role
output:
All-rounder	1
Batsman	5
Bowler	3
Wicketkeeper	1

15.
select Country, count(*) from Player
where Role = 'Bowler' group by Country
output:
Afghanistan	1
England	1
India	1

16.
select pid, sum(Runs) from PlayerPerformance
where Runs > 20 group by pid
output:
1	235
2	182
3	103
4	145
5	135
9	65
10	120
11	115
12	130

17.
select mid, sum(Wickets) from PlayerPerformance
where Wickets > 0 group by mid
output:
201	3
202	4
203	5
204	2
205	2
206	2

18.
select Country, count(*) from Player
group by Country having count(*) > 2
output:
India	6

19.
select pname, sum(Runs) from Player as P
join PlayerPerformance as PP
on P.pid = PP.pid group by pid, pname
having sum(Runs) > 100


20.
select mid, sum(Wickets) from PlayerPerformance
group by mid having sum(Wickets) > 3
output:
202	4
203	5

21.
select pname, sum(Runs) from Player as P
join PlayerPerformance as PP on P.pid = PP.pid
group by P.pid, P.pname
having sum(Runs) > 100
order by sum(Runs) desc
output:
Rohit Sharma	235
Virat Kohli	182
Dewald Brevis	145
David Warner	135
Kane Williamson	130
Suryakumar Yadav	120
kieron Pollard	115
Shubman Gill	103

22.
select pname, avg(Runs) from Player as P
join PlayerPerformance as PP on P.pid = PP.pid
group by P.pid, pname
having avg(Runs) > 30
order by avg(Runs) asc
output:
Sanju Samson	42
Shubman Gill	51
kieron Pollard	57
Suryakumar Yadav	60
Kane Williamson	65
David Warner	67
Dewald Brevis	72
Virat Kohli	91
Rohit Sharma	117

23.
update Team
set Ranking = 1
where tid = 101
select * from Team
where tid = 101
output:
101	India	India	Rahul Dravid	1

24.
update Player
set Age = Age + 1
where Age > 30 and Role = 'Batsman'
select * from Player
where Age > 30 and Role = 'Batsman'
output:
1	Rohit Sharma	40	Male	Batsman	India
2	Virat Kohli	39	Male	Batsman	India
10	Suryakumar Yadav	36	Male	Batsman	India
12	Kane Williamson	35	Male	Batsman	New Zealand

25.
update PlayerPerformance
set Catches = Catches + 1
where Wickets > 2 and Catches < 3
select * from PlayerPerformance
where Wickets > 2 and Catches < 3
output:
311	201	6	12	3	1
313	202	7	5	4	1
315	203	8	3	3	1

26.
delete from Player
where Age > 45 and Country <> 'India'
select * from Player

27.
delete from PlayerPerformance
where Runs < 5 and Wickets = 0

28.
delete from Team
where Ranking > 15 and Country = 'India'

29.
select pname, Role, Runs
from Player as P join PlayerPerformance as PP
on P.pid = PP.pid
output:
Rohit Sharma	Batsman	85
Rohit Sharma	Batsman	150
Virat Kohli	Batsman	72
Virat Kohli	Batsman	110
Shubman Gill	Batsman	35
Shubman Gill	Batsman	68
Dewald Brevis	Batsman	90
Dewald Brevis	Batsman	55
David Warner	Batsman	75
David Warner	Batsman	60
Jasprit Bumrah	Bowler	12
Jasprit Bumrah	Bowler	8
Jofra Archer	Bowler	5
Jofra Archer	Bowler	7
Rashid Khan	Bowler	3
Rashid Khan	Bowler	6
Sanju Samson	Wicketkeeper	65
Sanju Samson	Wicketkeeper	20
Suryakumar Yadav	Batsman	80
Suryakumar Yadav	Batsman	40
kieron Pollard	All-rounder	70
kieron Pollard	All-rounder	45
Kane Williamson	Batsman	95
Kane Williamson	Batsman	35

30.
select tname, mdate, Venue from Team as T
join Match as M on T.tid = M.tid1
output:
India	2026-01-10	Rajiv Gandhi Stadium
India	2026-01-15	Wankhede Stadium
Australia	2026-02-05	Melbourne Cricket Ground
India	2026-02-15	Eden Gardens
Pakistan	2026-03-01	Gaddafi Stadium
India	2026-03-10	Arun Jaitley Stadium

31.
select pname, mid, Runs, Wickets from Player as P
join PlayerPerformance as PP on P.pid = PP.pid
where PP.Runs > 50
output:
Rohit Sharma	201	85	0
Rohit Sharma	202	150	0
Virat Kohli	201	72	0
Virat Kohli	203	110	0
Shubman Gill	204	68	0
Dewald Brevis	201	90	0
Dewald Brevis	205	55	0
David Warner	202	75	0
David Warner	206	60	0
Sanju Samson	204	65	0
Suryakumar Yadav	205	80	0
kieron Pollard	205	70	0
Kane Williamson	204	95	0

32.
select pname, mdate, Venue, Runs from Player as P
join PlayerPerformance as PP on P.pid = PP.pid
join Match as M on PP.mid = M.mid
output:
Rohit Sharma	2026-01-10	Rajiv Gandhi Stadium	85
Rohit Sharma	2026-01-15	Wankhede Stadium	150
Virat Kohli	2026-01-10	Rajiv Gandhi Stadium	72
Virat Kohli	2026-02-05	Melbourne Cricket Ground	110
Shubman Gill	2026-01-15	Wankhede Stadium	35
Shubman Gill	2026-02-15	Eden Gardens	68
Dewald Brevis	2026-01-10	Rajiv Gandhi Stadium	90
Dewald Brevis	2026-03-01	Gaddafi Stadium	55
David Warner	2026-01-15	Wankhede Stadium	75
David Warner	2026-03-10	Arun Jaitley Stadium	60
Jasprit Bumrah	2026-01-10	Rajiv Gandhi Stadium	12
Jasprit Bumrah	2026-02-05	Melbourne Cricket Ground	8
Jofra Archer	2026-01-15	Wankhede Stadium	5
Jofra Archer	2026-02-15	Eden Gardens	7
Rashid Khan	2026-02-05	Melbourne Cricket Ground	3
Rashid Khan	2026-03-01	Gaddafi Stadium	6
Sanju Samson	2026-02-15	Eden Gardens	65
Sanju Samson	2026-03-10	Arun Jaitley Stadium	20
Suryakumar Yadav	2026-03-01	Gaddafi Stadium	80
Suryakumar Yadav	2026-03-10	Arun Jaitley Stadium	40
kieron Pollard	2026-03-01	Gaddafi Stadium	70
kieron Pollard	2026-03-10	Arun Jaitley Stadium	45
Kane Williamson	2026-02-15	Eden Gardens	95
Kane Williamson	2026-03-10	Arun Jaitley Stadium	35

33.
select pname, mtype, Venue, Wickets from Player as P
join PlayerPerformance as PP on P.pid = PP.pid
join Match as M on PP.mid = M.mid
where PP.Wickets > 2
output:
Jasprit Bumrah	T20	Rajiv Gandhi Stadium	3
Jofra Archer	ODI	Wankhede Stadium	4
Rashid Khan	T20	Melbourne Cricket Ground	3

34.
select pname from Player as P
join PlayerPerformance as PP on P.pid = PP.pid
where Runs > (select avg(Runs) from PlayerPerformance)
output:
Rohit Sharma
Rohit Sharma
Virat Kohli
Virat Kohli
Shubman Gill
Dewald Brevis
Dewald Brevis
David Warner
David Warner
Sanju Samson
Suryakumar Yadav
kieron Pollard
Kane Williamson

35.
select pname, sum(Runs) from Player as P
join PlayerPerformance as PP on P.pid = PP.pid
group by P.pid, pname
having sum(Runs) > ( select sum(Runs) from PlayerPerformance
                     where pid = 5)
output:
Rohit Sharma	235
Virat Kohli	182
Dewald Brevis	145
