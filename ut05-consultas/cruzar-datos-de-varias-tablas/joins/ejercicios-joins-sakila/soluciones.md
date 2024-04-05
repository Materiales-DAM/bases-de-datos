# Soluciones

1\.

```sql
SELECT *
FROM
	rental r
	INNER JOIN customer c ON c.customer_id = r.customer_id 
WHERE c.active = 1
ORDER BY c.customer_id, r.rental_date;
```

2\.

```sql
SELECT *
FROM 
	staff sta 
	LEFT JOIN store sto ON sta.store_id = sto.store_id 
ORDER BY sta.first_name , sta.last_name ;
```

3\.

```sql
SELECT *
FROM
	film f 
	FULL JOIN film_actor fa ON f.film_id = fa.film_id 
	FULL JOIN actor a ON a.actor_id = fa.actor_id 
ORDER BY f.title, a.first_name , a.last_name ;
```

4\.

```sql
SELECT 
	c.category_id, 
	c.name AS category_name, 
	c.last_update, 
	f.*
FROM
	category c 
	INNER JOIN film_category fc ON c.category_id = fc.category_id 
	INNER JOIN film f ON fc.film_id =f.film_id 
ORDER BY c.name;
```

5\.

```sql
SELECT c.first_name, c.last_name, f.title, r.rental_date, r.inventory_id, r.return_date 	
FROM
	rental r 
	INNER JOIN customer c ON r.customer_id = c.customer_id 
	INNER JOIN inventory i ON r.inventory_id = i.inventory_id 
	INNER JOIN film f ON i.film_id = f.film_id 
WHERE
	r.return_date IS NOT NULL;
```

6\.

```sql
SELECT c.city 
FROM 
	store sto 
	INNER JOIN staff sta ON sto.manager_staff_id = sta.staff_id 
	INNER JOIN address a ON sto.address_id = a.address_id 
	INNER JOIN city c ON a.city_id = c.city_id 
WHERE 
	sta.first_name = 'Jon' AND sta.last_name = 'Stephens';

```

7\.

```sql
SELECT c.*
FROM
	customer c 
	INNER JOIN address a ON a.address_id = c.address_id 
	INNER JOIN city ci ON a.city_id = ci.city_id 
WHERE
	ci.city = 'London';
```

8\.

```sql
SELECT *
FROM
	store sto
	LEFT JOIN staff sta ON sto.store_id = sta.store_id 
	LEFT JOIN address a ON a.address_id = sta.address_id 
	LEFT JOIN city c ON c.city_id = a.city_id 
ORDER BY sto.store_id , sta.staff_id ;
```

9\.

```sql
SELECT sta.*
FROM
	staff sta
	INNER JOIN store sto ON sta.store_id = sto.store_id 
	INNER JOIN address a ON a.address_id = sto.address_id 
	INNER JOIN city c ON c.city_id = a.city_id 
WHERE
	c.city = 'Woodridge';
```

10.

```sql
SELECT DISTINCT co.country , sto.*
FROM
	country co
	LEFT JOIN city c ON co.country_id  = c.country_id  
	LEFT JOIN address a ON c.city_id  = a.city_id  
	LEFT JOIN store sto ON a.address_id = sto.address_id 
ORDER BY co.country ;
```

11\.

```sql
SELECT r.* 
FROM 
	rental r 
	INNER JOIN customer c ON r.customer_id = c.customer_id 
	INNER JOIN address a ON c.address_id = a.address_id 
	INNER JOIN city ci ON a.city_id = ci.city_id 
	INNER JOIN country co ON ci.country_id = co.country_id 
WHERE
	co.country = 'India' OR co.country = 'Senegal'
ORDER BY
	co.country, c.customer_id, r.rental_date;
```

12\.

```sql
SELECT i.inventory_id, s.store_id , f.title 
FROM
	store s 
	INNER JOIN inventory i ON s.store_id = i.store_id 
	INNER JOIN film f ON f.film_id = i.film_id 
	INNER JOIN film_category fc ON f.film_id = fc.film_id 
	INNER JOIN category c ON c.category_id = fc.category_id 
	INNER JOIN language l ON l.language_id = f.language_id 
WHERE
	l.name ='English' AND c.name = 'Documentary'

```

13\.

```sql
SELECT DISTINCT s.*
FROM
	store s 
	INNER JOIN staff sta ON sta.store_id = s.store_id;
```

14\.

```sql
SELECT DISTINCT c.*
FROM
	customer c 
	INNER JOIN rental r ON c.customer_id = r.customer_id 
	INNER JOIN staff s ON s.staff_id =r.staff_id 
	INNER JOIN store sto ON s.store_id = sto.store_id 
	INNER JOIN address a ON a.address_id  = sto.address_id 
	INNER JOIN city ci ON ci.city_id = a.city_id 
WHERE ci.city = 'London';
```

15\.

```sql
SELECT DISTINCT f.* 
FROM
	film f 
	INNER JOIN film_actor fa ON f.film_id = fa.film_id 
	INNER JOIN actor a ON fa.actor_id = a.actor_id 
WHERE a.first_name = 'PENELOPE'
ORDER BY f.film_id ;
```

16\.

```sql
SELECT DISTINCT c.*
FROM 
	category c 
	INNER JOIN film_category fc ON c.category_id =fc.category_id 
	INNER JOIN film f ON f.film_id = fc.film_id 
	INNER JOIN "language" l ON f.language_id = l.language_id 
where 
	l."name" = 'English'
ORDER BY c."name" ;

```

17\.

```sql
SELECT DISTINCT f.* 
FROM
	film f 
	INNER JOIN film_actor fa1 ON f.film_id = fa1.film_id 
	INNER JOIN actor a1 ON fa1.actor_id = a1.actor_id 
	INNER JOIN film_actor fa2 ON f.film_id = fa2.film_id 
	INNER JOIN actor a2 ON a2.actor_id = fa2.actor_id AND a2.actor_id < a1.actor_id
WHERE a1.first_name = a2.first_name 
ORDER BY f.title ;
```

18\.

```sql
```

19\.

```sql
```

20\.

```sql
```
