-- Name: Linh Nguyen
-- File: Quiz05-linh.sql
-- Date: July 30, 2020

use TSQLV4;

with Q as
(select od.productid, sum(od.qty) as sumqty, year(o.orderdate) as yr,
	month(o.orderdate) as mth from sales.orderdetails od 
	join sales.orders o on od.orderid = o.orderid
	group by productid, year(o.orderdate), month(o.orderdate))
select productid, datefromparts(yr, mth, 1) as monthyear,
	sumqty as thisMonth, lag(sumqty) over (partition by productid
	order by yr, mth) as lastMonth, sumqty - lag(sumqty) over (partition by productid
	order by yr, mth) as diff,
	convert(decimal(10,2), 100.0 * (sumqty - lag(sumqty) over (partition by
	productid order by yr, mth) * 1.0 / convert(decimal(10,2), (lag(sumqty) over (partition by productid order by
	yr, mth) * 1.0 )))) as pctIncDec,
	sum(sumqty) over (partition by productid order by yr, mth rows between unbounded preceding and current row) as running,
	convert(decimal(10,2), 100.0 * sumqty / lag(sumqty) over (partition by productid order by yr, mth)) as pctChange,
	sum(sumqty) over (partition by productid) as totalPerProduct,
	convert(decimal(10,2), 100.0 * sumqty / sum(sumqty) over (partition by productid)) as pctLinePerProduct
	from Q;

	