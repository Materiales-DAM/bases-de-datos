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

# Soluciones vistas

1. ```sql
   CREATE VIEW actor_full_name AS
   SELECT first_name, last_name
   FROM actor; 
   ```
2. ```sql
   CREATE VIEW films_info AS
   SELECT f.title, f.LENGTH
   FROM film f; 
   ```
3. ```sql
   CREATE VIEW nombre_apellido_corre_clientes AS 
   SELECT first_name, last_name, email
   FROM customer;
   ```
4. ```sql
   CREATE MATERIALIZED VIEW peliculas_actores AS 
   SELECT f.title, a.first_name,a.last_name
   FROM film f
   INNER JOIN film_actor USING(film_id)
   INNER JOIN actor a USING (actor_id);
   ```
5. ```sql
   CREATE MATERIALIZED VIEW pelicula_nombre_actores_veces_que_aparece AS
   SELECT f.title, a.first_name, a.last_name, count(actor_id) AS num_roles
   FROM film f
   INNER JOIN film_actor fa USING(film_id)
   INNER JOIN actor a USING (actor_id)
   GROUP BY f.film_id , a.actor_id; 
   ```
6. ```sql
   CREATE VIEW film_inventory AS
   SELECT title, store_id, COUNT(*) AS total, COUNT(*) - COUNT(r.rental_id) AS available
   FROM film f
   INNER JOIN inventory i USING (film_id)
   LEFT JOIN rental r ON r.inventory_id = i.inventory_id AND r.return_date IS NULL
   GROUP BY i.store_id, f.film_id;
   ```
7. ```sql
   CREATE VIEW vista_gasto_clientes AS
   SELECT c.first_name, c.last_name, SUM(p.amount) AS total_gastado
   FROM customer c
   INNER JOIN payment p using (customer_id)
   GROUP BY c.customer_id; 
   ```
8. ```sql
   CREATE MATERIALIZED VIEW titulo_idioma AS
   SELECT f.title, l.name
   FROM film f 
   JOIN language l USING(language_id);
   ```
9. ```sql
   CREATE VIEW film_category_name AS
   SELECT f.title, c.name
   FROM film f
   INNER JOIN film_category fc USING (film_id)
   INNER JOIN category c USING (category_id); 
   ```
10. ```sql
    CREATE MATERIALIZED VIEW nameofactor_titleoffilm_rentaldate AS
    SELECT a.first_name, a.last_name, f.title, r.rental_date
    FROM actor a 
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    INNER JOIN film f ON fa.film_id = f.film_id 
    INNER join inventory i ON f.film_id = i.film_id 
    INNER JOIN rental r ON i.inventory_id = r.inventory_id;
    ```
