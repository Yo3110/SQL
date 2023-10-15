-- SQL PROJECT- MUSIC STORE DATA ANALYSIS-- Q1. Who is the senior most employee based on job title?select top 1 * from employee order by levels desc;-- Q2: Which countries have the most Invoices?select top 1 count(*) as Invoice_Count, billing_country from invoicegroup by billing_country order by Invoice_Count desc;-- Q3: What are top 3 values of total invoice?SELECT top 3 * from invoiceOrder by total desc;-- Q4: Which city has the best customers? -- We would like to throw a promotional Music Festival in the city we made the most money. -- Write a query that returns one city that has the highest sum of invoice totals. -- Return both the city name & sum of all invoice totalsselect top 1 sum(total) as Invoice_Total, billing_city from invoicegroup by billing_cityorder by Invoice_Total desc;-- Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. -- Write a query that returns the person who has spent the most money.-- Using join concept for gathering data from two tables 1. CUSTOMER Table and 2. Invoice TableSELECT TOP 1 customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY total DESC;-- Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A.

select distinct email, first_name, last_name from customer
JOIN INVOICE ON CUSTOMER.customer_id=invoice.customer_id
JOIN invoice_line ON invoice.invoice_id=invoice_line.invoice_id
where track_id IN(
select track_id from track
JOIN genre ON TRACK.genre_id=genre.genre_id
WHERE genre.name LIKE 'ROCK')
ORDER by email;


-- Q7. Let's invite the artists who have written the most rock music in our dataset. 
-- Write a query that returns the Artist name and total track count of the top 10 rock bands

select top 10 artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
From track
JOIN album on album.album_id=track.album_id
JOIN artist on artist.artist_id=album.artist_id
JOIN genre on genre.genre_id=track.genre_id
where genre.name LIKE 'Rock'
group by artist.artist_id, artist.name
order by number_of_songs DESC;


-- Q8. Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track.
-- Order by the song length with the longest songs listed first

select name, milliseconds
from track
where milliseconds> (
select avg(milliseconds) AS avg_track_length
from track) order by milliseconds desc;



-- Q9. Find how much amount spent by each customer on artists? Write a query to returns customer name, artist name and total spent

	 SELECT c.first_name, c.last_name, arts.name, sum(il.unit_price*il.quantity) as total_spent
	 from customer c
	 JOIN invoice i on c.customer_id = i.customer_id
	 JOIN invoice_line il on il.invoice_id = i.invoice_id
	 JOIN track t on t.track_id = il.track_id
	 JOIN album alb on alb.album_id = t.album_id
	 JOIN artist arts on arts.artist_id = alb.artist_id
	 where arts.name = 'queen'
	 group by c.first_name, c.last_name, arts.name;  


-- Q10. We want to find out the most popular music Genre for each country. We determine the 
-- most popular genre as the genre with the highest amount of purchases. Write a query 
-- that returns each country along with the top Genre. For countries where the maximum 
-- number of purchases is shared return all Genres

with cte as (
     select c.country, g.name, count(il.quantity) as qty_of_purchase,
	 row_number() over(PARTITION by c.country order by count(il.quantity) desc)as rn
	 from customer c
	 JOIN invoice I ON C.customer_id = I. customer_id
	 jOIN invoice_line il on il.invoice_id = i.invoice_id
	 JOIN track t on t.track_id = il.track_id
	 JOIN genre g on g.genre_id = t.genre_id
	 group by c.country, g.name)

select country, name, qty_of_purchase from cte where rn<=1;


-- Q11. Write a query that determines the customer that has spent the most on music for each 
-- country. Write a query that returns the country along with the top customer and how
-- much they spent. For countries where the top amount spent is shared, provide all 
-- customers who spent this amount

with cte as (
     SELECT c.first_name, c.last_name, i.billing_country, sum(i.total) as total_spent,
	 rank() over(partition by i.billing_country order by sum(i.total)desc)as rnk
	 from customer c
	 join invoice i on c.customer_id = i.customer_id
	 group by c.first_name, c.last_name, i.billing_country)

	 SELECT first_name, last_name, billing_country, total_spent
	 from cte
	 where rnk =1;


