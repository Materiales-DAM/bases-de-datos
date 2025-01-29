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
   ```
9. ```sql
   ```
10. ```sql
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
