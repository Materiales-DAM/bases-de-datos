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

# Soluciones subqueries I

1. ```sql
   SELECT *
   FROM film
   WHERE film_id IN (
   	SELECT film_id
   	FROM film_category
   	WHERE category_id IN (
   		SELECT category_id
   		FROM category
   		WHERE name = 'Action' OR name = 'Horror'
   	)
   );
   ```
2. ```sql
   ```
3. ```sql
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
