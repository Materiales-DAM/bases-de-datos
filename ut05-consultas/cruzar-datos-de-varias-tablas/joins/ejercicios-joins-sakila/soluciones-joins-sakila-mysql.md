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
   ```
4. ```sql
   ```
5. ```
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
