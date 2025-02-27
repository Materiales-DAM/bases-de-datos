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

# Soluciones fechas

1. ```sql
   # MySQL
   SELECT YEAR(create_date)
   FROM customer;

   -- PostgreSQL
   SELECT date_part('year', create_date)
   FROM customer;
   ```
2. ```sql
   # MySQL
   SELECT f.title, MONTH(r.return_date)AS mes_devulocion_pelicula
   FROM film f
   INNER JOIN inventory i ON f.film_id = i.film_id
   INNER JOIN rental r ON i.inventory_id = r.inventory_id; 

   -- PostgreSQL
   SELECT f.title, date_part('month', r.return_date)AS mes_devulocion_pelicula
   FROM film f
   INNER JOIN inventory i ON f.film_id = i.film_id
   INNER JOIN rental r ON i.inventory_id = r.inventory_id; 
   ```
3. ```sql
   # MySQL
   SELECT WEEKDAY(rental_date) AS dia_rental
   FROM rental; 

   -- Postgres
   SELECT date_part('dow', rental_date) AS dia_rental
   FROM rental; 
   ```
4. ```sql
   SELECT MIN(return_date) AS oldest_return
   FROM rental; 
   ```
5. ```sql
   SELECT MAX(return_date) AS oldest_return
   FROM rental; 
   ```
6. ```sql
   # MySQL
   SELECT MONTH(rental_date) AS mes ,count(*) AS total_alquileres
   FROM rental r 
   GROUP BY mes; 

   -- Postgres
   SELECT DATE_PART('month',rental_date) AS mes ,count(*) AS total_alquileres
   FROM rental r 
   GROUP BY mes; 
   ```
7. ```sql
   # MySQL
   SELECT WEEKDAY(payment_date) AS dia_semana
   FROM payment p 
   GROUP BY dia_semana 
   ORDER BY count(*) DESC
   LIMIT 1; 

   -- Postgres
   SELECT DATE_PART('dow',payment_date) AS dia_semana
   FROM payment p 
   GROUP BY dia_semana 
   ORDER BY count(*) DESC
   LIMIT 1; 
   ```
8. ```sql
   # MySQL
   SELECT MONTHNAME(rental_date) AS month
   FROM rental
   GROUP BY month
   ORDER BY COUNT(*) DESC
   LIMIT 1; 

   -- Postgres
   SELECT date_part('month', rental_date) AS month
   FROM rental
   GROUP BY month
   ORDER BY COUNT(*) DESC
   LIMIT 1; 
   ```
