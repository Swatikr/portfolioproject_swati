select * from employee;
/*Q: Who is the senior most employee based on job title? */
select * from employee order by levels desc limit 1;
/*  Q: Which countries have the most Invoices? */
select count(*) as c,billing_country from invoice 
group by billing_country
order by c desc;
/*What are top 3 values of total invoice?*/
select total from invoice 
order by total desc limit 3;
/* Q: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals*/

select sum(total) as invoice_total, billing_city from invoice
group by billing_city
order by billing_city desc;
/*Q: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total)as total from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc limit 1;

/*Q: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A.*/

select distinct email,first_name, last_name from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
where track_id in(
select track_id from track
join genre on track.genre_id=genre.genre_id
where genre.name like "rock"
)
order by email;

/*Q: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.*/

select name,milliseconds 
from track
where milliseconds>
(select avg(milliseconds)as avg_song_lenght
from track)
order by milliseconds desc;











