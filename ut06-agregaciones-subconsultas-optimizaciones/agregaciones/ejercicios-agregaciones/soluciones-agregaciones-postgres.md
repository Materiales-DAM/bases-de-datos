---
cover: ../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
layout:
  cover:
    visible: true
    size: full
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
---

# Soluciones agregaciones Postgres

1. ```sql
   SELECT count(*) as num_payments
   FROM payment;
   ```
2. ```sql
   SELECT sum(amount) AS total_amount
   FROM payment;
   ```
3. ```sql
   SELECT COUNT(f.film_id) AS total_horror
   FROM film f
   INNER JOIN film_category fc ON f.film_id= fc.film_id
   INNER JOIN category c ON fc.category_id= c.category_id
   WHERE c.name= 'Horror'; 
   ```
4. ```sql
   SELECT avg(p.amount) as avg_amount
   FROM sakila.payment p
   WHERE 
       date_part('year', payment_date)=2005 
       AND 
       date_part('month', payment_date)=5; 
   ```
5. ```sql
   SELECT COUNT (film_id) as actor_films
   FROM film_actor fa
   INNER JOIN actor a ON fa.actor_id = a.actor_id
   WHERE a.first_name = 'MATTHEW' AND a.last_name = 'JOHANSSON'; 
   ```
6. ```sql
   SELECT COUNT(*) as city_inventories
   FROM inventory i
   INNER JOIN store s ON i.store_id = s.store_id
   INNER JOIN address a ON a.address_id = s.address_id 
   INNER JOIN city c ON c.city_id = a.city_id 
   WHERE c.city = 'Woodridge'; 
   ```
