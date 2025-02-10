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

# Soluciones joins sakila MySQL



1. ```sql
   SELECT *
   FROM rental r
   INNER JOIN customer c ON r.customer_id = c.customer_id
   WHERE c.active = 1
   ORDER BY c.customer_id, r.rental_date;
   ```
2. ```sql
   SELECT *
   FROM staff sta
   LEFT JOIN store sto ON sta.store_id = sto.store_id
   ORDER BY sta.first_name, sta.last_name; 
   ```
3. ```sql
   # NO se puede hacer
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
    SELECT r.*
    FROM rental r
    INNER JOIN customer c  ON c.customer_id  = r.customer_id
    INNER JOIN address a ON a.address_id = c.address_id
    INNER JOIN city ci ON ci.city_id = a.city_id 
    INNER JOIN country co ON co.country_id = ci.country_id 
    WHERE co.country = 'Canada' OR co.country = 'Senegal'; 
    ```
12. ```sql
    SELECT i.inventory_id, i.store_id, f.title
    FROM inventory i
    INNER JOIN film f ON i.film_id = f.film_id
    INNER JOIN language l ON f.language_id = l.language_id
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
    WHERE l.name = 'English' AND c.name = 'Documentary'; 
    ```
13. ```sql
    SELECT DISTINCT s.*
    FROM store s 
    INNER JOIN staff s2 ON s2.store_id =s.store_id; 
    ```
14. ```sql
    SELECT DISTINCT c.*
    FROM customer c 
    INNER JOIN rental r ON c.customer_id = r.customer_id 
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id 
    INNER JOIN store s ON i.store_id = s.store_id 
    INNER JOIN address a ON s.address_id = a.address_id 
    INNER JOIN city ci ON a.city_id = ci.city_id
    WHERE ci.city = 'Woodridge'; 
    ```
15. ```sql
    SELECT DISTINCT f.* 
    FROM film f 
    INNER JOIN film_actor fa ON f.film_id = fa.film_id 
    INNER JOIN actor a ON fa.actor_id = a.actor_id
    WHERE a.first_name = 'PENELOPE'; 
    ```
16. ```sql
    SELECT DISTINCT cat.*
    FROM category cat
    INNER JOIN film_category fc ON cat.category_id= fc.category_id
    INNER JOIN film f ON fc.film_id = f.film_id
    INNER JOIN language lng ON f.language_id = lng.language_id
    WHERE lng.name = 'English'; 
    ```
17. ```sql
    SELECT DISTINCT f.*
    FROM film f
    INNER JOIN film_actor fa1 ON f.film_id = fa1.film_id
    INNER JOIN actor a1 ON fa1.actor_id = a1.actor_id
    INNER JOIN film_actor fa2 ON f.film_id = fa2.film_id AND a1.actor_id <> fa2.actor_id
    INNER JOIN actor a2 ON fa2.actor_id = a2.actor_id AND a1.first_name = a2.first_name; 
    ```
18. ```sql
    SELECT DISTINCT f.title
    	FROM inventory i
    	LEFT JOIN rental no_devuelto ON i.inventory_id =no_devuelto.inventory_id AND no_devuelto.return_date IS NULL
    	INNER JOIN store s ON i.store_id = s.store_id
    	INNER JOIN address a ON s.address_id = a.address_id
    	INNER JOIN city c ON a.city_id = c.city_id
    	INNER JOIN film f ON i.film_id = f.film_id
    	WHERE c.city = 'Lethbridge'AND no_devuelto.rental_id IS  NULL; 
    ```
19. ```sql
    SELECT DISTINCT s.*
    FROM staff s 
    INNER JOIN rental r 
    	ON s.staff_id = r.staff_id 
    INNER JOIN inventory i 
    	ON r.inventory_id = i.inventory_id 
    INNER JOIN film f 
    	ON i.film_id = f.film_id 
    INNER JOIN store st
    	ON st.store_id = i.store_id    
    INNER JOIN customer c 
    	ON r.customer_id = c.customer_id 
    INNER JOIN address a 
    	ON c.address_id = a.address_id 
    INNER JOIN city ci
    	ON a.city_id = ci.city_id 
    WHERE f.title = 'ACADEMY DINOSAUR' AND ci.city = 'Sucre'; 
    ```
20. ```sql
    ```
