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

# Soluciones agrupaciones

1. ```sql
   SELECT i.film_id, SUM(p.amount) AS amount_per_film
   FROM inventory i
   INNER JOIN rental r ON r.inventory_id = i.inventory_id
   INNER JOIN payment p ON p.rental_id = r.rental_id
   GROUP BY i.film_id;
   ```
2. ```sql
   SELECT  customer_id ,count(*) AS numeros_de_alquleres
   FROM rental 
   GROUP BY customer_id ; 
   ```
3. ```sql
   SELECT c.category_id, c.name, COUNT(*) as num_films
   FROM film f
   INNER JOIN film_category fc ON f.film_id = fc.film_id 
   INNER JOIN category c ON fc.category_id = c.category_id 
   GROUP BY c.category_id ;
   ```
4. ```sql
   ```
5. ```sql
   ```
6. ```sql
   ```
7. ```sql
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
15. ```sql
    ```
16. ```sql
    ```
17. ```sql
    ```
18. ```sql
    ```
19. ```sql
    ```
20. ```sql
    ```
