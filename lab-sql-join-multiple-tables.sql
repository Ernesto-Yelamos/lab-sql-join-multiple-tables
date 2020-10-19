# Lab | SQL Joins on multiple tables
#In this lab, you will be using the Sakila database of movie rentals.
use sakila;
set sql_safe_updates=0;

### Instructions
	-- 1. Write a query to display for each store its store ID, city, and country.
select a.store_id, c.city, d.country from sakila.store as a
join sakila.address as b on a.address_id = b.address_id
join sakila.city as c on b.city_id = c.city_id
join sakila.country as d on c.country_id = d.country_id;
    
	-- 2. Write a query to display how much business, in dollars, each store brought in.
select a.store_id, count(c.amount) as 'Business in $' from sakila.store as a
join sakila.staff as b on a.store_id = b.store_id
join sakila.payment as c on b.staff_id = c.staff_id
group by a.store_id;
    
	-- 3. What is the average running time of films by category?
select avg(a.length) as 'Average length', c.name as 'Category' from sakila.film as a
join sakila.film_category as b on a.film_id = b.film_id
join sakila.category as c on b.category_id = c.category_id
group by c.name;
    
	-- 4. Which film categories are longest?
select avg(a.length) as 'Average length', c.name as 'Category' from sakila.film as a
join sakila.film_category as b on a.film_id = b.film_id
join sakila.category as c on b.category_id = c.category_id
group by c.name
order by avg(a.length) desc;
    
	-- 5. Display the most frequently rented movies in descending order.
select a.title, count(c.rental_id) as 'Amount rentals' from sakila.film as a
join sakila.inventory as b on a.film_id = b.film_id
join sakila.rental as c on b.inventory_id = c.inventory_id
group by a.title
order by count(c.rental_id) desc;
    
	-- 6. List the top five genres in gross revenue in descending order.
select a.name, count(e.amount) as 'Gross revenue' from sakila.category as a 
join sakila.film_category as b on a.category_id = b.category_id
join sakila.inventory as c on b.film_id = c.film_id
join sakila.rental as d on c.inventory_id = d.inventory_id
join sakila.payment as e on d.rental_id = e.rental_id
group by a.name
order by count(e.amount) desc
limit 5;

	-- 7. Is "Academy Dinosaur" available for rent from Store 1?
select a.store_id, b.title as 'Title', count(a.film_id) as 'Amount' from sakila.inventory as a
join sakila.film as b on a.film_id = b.film_id
where a.store_id = 1 and b.title = 'ACADEMY DINOSAUR';


