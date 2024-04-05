# Soluciones

1\.

<pre class="language-sql"><code class="lang-sql"><strong>SELECT COUNT(*) AS number_payments FROM payment;
</strong></code></pre>



2\.

```sql
SELECT SUM(amount) as total_amount FROM payment;
```

3\.

```sql
SELECT COUNT(*) AS horror_films_count
FROM
	film f 
	INNER JOIN film_category fc ON fc.film_id  = f.film_id 
	INNER JOIN category c ON c.category_id = fc.category_id 
WHERE c.name = 'Horror';
```

4\.

```sql
SELECT AVG(p.amount) AS average_amount_may_2005
FROM
	payment p
WHERE MONTH(p.payment_date) = 5 AND YEAR(p.payment_date) = 2005;
```

5\.

```sql
SELECT
	COUNT(*)
FROM
	film f 
	INNER JOIN film_actor fa ON fa.film_id = f.film_id 
	INNER JOIN actor a ON a.actor_id = fa.actor_id  
WHERE 
	a.first_name ='MATTHEW' AND a.last_name  = 'JOHANSSON';
```

6\.

```sql
SELECT COUNT(*)
FROM
	inventory i 
	INNER JOIN store s ON s.store_id = i.store_id 
	INNER JOIN address a ON a.address_id = s.address_id 
	INNER JOIN city c ON a.city_id = c.city_id 
WHERE 
	c.city ='Woodridge';
```
