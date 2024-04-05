# Soluciones

1\.

```sql
SELECT a.first_name 
FROM actor a , film_actor fa 
WHERE a.actor_id = fa.actor_id AND fa.film_id = 5;
```

2\.

```sql
SELECT c.first_name, r.rental_date
FROM rental r , customer c 
WHERE c.customer_id = r.customer_id 
ORDER BY c.first_name, r.rental_date;
```

3\.

```sql
SELECT c.first_name, a.postal_code
FROM customer c , address a 
WHERE c.address_id = a.address_id 
ORDER BY c.last_name , c.first_name;
```

4\.

```sql
SELECT f.title, a.first_name, a.last_name 
FROM actor a , film_actor fa , film f
WHERE a.actor_id = fa.actor_id AND f.film_id = fa.film_id
ORDER BY f.title , a.first_name;
```

5\.

```sql
SELECT f.title, c.name
FROM category c, film_category fc , film f 
WHERE c.category_id = fc.category_id AND fc.film_id = f.film_id
ORDER BY f.title, c.name;
```

6\.

```sql
SELECT c.first_name, c.last_name, r.rental_date, f.title, i.inventory_id
FROM
	customer c, rental r, inventory i , film f
WHERE c.customer_id  = r.customer_id  AND r.inventory_id = i.inventory_id  AND i.film_id  = f.film_id 
ORDER BY c.customer_id, r.rental_date , f.title, i.inventory_id ;
```

7\.

```sql
SELECT a.first_name, a.last_name, f.title
FROM
	actor a, film_actor fa , film f 
WHERE 
	a.actor_id = fa.actor_id AND f.film_id =fa.film_id 
ORDER BY a.first_name, a.last_name, f.title ;
```

8\.

```sql
SELECT f.title, r.return_date
FROM film f, inventory i, rental r
WHERE 
	f.film_id = i.film_id AND r.inventory_id = i.inventory_id 
ORDER BY f.title , r.return_date ;
```

9\.

```sql
SELECT a.first_name, a.last_name, f.title
FROM
	actor a , film_actor fa , film f 
WHERE
	a.actor_id = fa.actor_id AND fa.film_id = f.film_id AND f.rating != 'PG-13'
ORDER BY a.first_name, a.last_name , f.title ;
```

10\.

```sql
SELECT c.first_name, c.last_name
FROM
	customer c, rental r 
WHERE 
	c.customer_id = r.customer_id 
ORDER BY r.rental_date DESC
LIMIT 1;
```
