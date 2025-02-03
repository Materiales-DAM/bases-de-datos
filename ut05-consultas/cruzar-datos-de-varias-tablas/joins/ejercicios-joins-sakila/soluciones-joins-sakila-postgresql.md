---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
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

# Soluciones joins sakila PostgreSQL



1. ```sql
   SELECT *
   FROM sakila.rental r
   INNER JOIN sakila.customer c ON r.customer_id = c.customer_id
   WHERE c.active = 1
   ORDER BY c.customer_id, r.rental_date;
   ```
2. ```sql
   SELECT f.*, a.*
   FROM film f
   FULL JOIN film_actor fa ON f.film_id = fa.film_id
   FULL JOIN actor a ON fa.actor_id=a.actor_id
   ORDER BY f.title;
   ```
3. ```sql
   SELECT f.*, c.*
   FROM category c
   INNER JOIN film_category fc ON fc.category_id = c.category_id
   INNER JOIN film f ON f.film_id = fc.film_id; 
   ```
4. ```sql
   # Con el LEFT JOIN se incluyen categorías sin películas
   SELECT f.*, c.*
   FROM category c
   LEFT JOIN film_category fc ON fc.category_id = c.category_id
   LEFT JOIN film f ON f.film_id = fc.film_id; 
   ```
5. ```sql
   SELECT c.first_name, c.last_name, f.title, r.rental_date, i.inventory_id, r.return_date
   FROM rental r
   INNER JOIN inventory i ON r.inventory_id = i.inventory_id 
   INNER JOIN film f ON f.film_id = i.film_id
   INNER JOIN customer c ON r.customer_id = c.customer_id 
   WHERE r.return_date  IS NOT NULL;
   ```
6. ```sql
   SELECT c.city
   FROM staff st
   INNER JOIN store s ON s.manager_staff_id = st.staff_id 
   INNER JOIN address a ON st.address_id = a.address_id
   INNER JOIN city c ON a.city_id = c.city_id
   WHERE st.first_name ='Jon' AND  st.last_name ='Stephens'; 
   ```
7. ```sql
   SELECT c.*
   FROM customer c
   INNER JOIN address a ON c.address_id = a.address_id
   INNER JOIN city ct ON a.city_id = ct.city_id
   WHERE city='London' 
   ```
8. ```sql
   SELECT sto.*, sta.*, a.*, c.*
   FROM store sto 
   LEFT JOIN staff sta ON sto.store_id = sta.store_id
   LEFT JOIN address a ON sta.address_id = a.address_id
   LEFT JOIN city c ON a.city_id = c.city_id
   ORDER BY sto.store_id, sta.staff_id; 
   ```
9. ```sql
   SELECT sta.* 
   FROM staff sta
   inner JOIN store s ON sta.store_id = s.store_id 
   INNER JOIN address a ON s.address_id = a.address_id
   INNER JOIN city c ON a.city_id = c.city_id
   WHERE city='Woodridge'; 
   ```
10. ```sql
    SELECT DISTINCT co.*, s.* 
    FROM country co
    LEFT JOIN city ci ON ci.country_id = co.country_id
    LEFT JOIN address a ON a.city_id = ci.city_id
    LEFT JOIN store s ON a.address_id = s.address_id 
    ORDER BY co.country; 
    ```
11. ```sql
    ```
12. ```sql
    ```
13. ```sql
    ```
14. ```sql
    ```
15. ```
    ```
16. ```
    ```
17. ```
    ```
18. ```
    ```
19. ```
    ```
20. ```
    ```
