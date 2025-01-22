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

# Soluciones SELECT PostgreSQL



1. ```sql
   SELECT description
   FROM sakila.film 
   WHERE description LIKE '%Adventure%' OR description LIKE '%Action%'
   ORDER BY title;
   ```
2. ```sql
   SELECT * 
   FROM sakila.category
   WHERE name = 'Drama' OR name = 'Music'
   ORDER BY name ;
   ```
3. ```sql
   SELECT city 
   FROM sakila.city
   WHERE city_id = 1 OR city_id = 2
   ORDER BY city DESC; 
   ```
4. ```sql
   SELECT first_name , last_name
   FROM sakila.customer
   WHERE email IS NOT NULL 
   ORDER BY last_name ASC; 
   ```
5. ```sql
   SELECT address
   FROM sakila.address
   WHERE postal_code LIKE '48%' AND district ='California'
   ORDER BY city_id DESC; 
   ```
6. ```sql
   SELECT *
   FROM sakila.language
   WHERE name = 'Spanish' OR name = 'French'
   ORDER BY name ; 
   ```
7. ```sql
   -- NO aplica
   ```
8. ```sql
   SELECT name
   FROM sakila.category
   WHERE LENGTH(name) > 10 OR name LIKE 'A%'
   ORDER BY name ASC; 
   ```
9. ```sql
   SELECT name
   FROM sakila.category
   WHERE name = 'Action' OR name = 'Travel'
   ORDER BY name ASC;
   ```
10. ```sql
    SELECT first_name, last_name
    FROM sakila.staff
    WHERE (store_id = 1 OR store_id = 2) AND picture IS NOT NULL 
    ORDER BY last_name;
    ```
11. ```sql
    SELECT first_name, last_name
    FROM sakila.customer
    ORDER BY last_name
    LIMIT 50 OFFSET 50; 
    ```
12. ```sql
    SELECT title, description
    FROM sakila.film
    WHERE length > 120
    ORDER BY length DESC, title
    LIMIT 10 OFFSET 30;
    ```
13. ```sql
    SELECT name
    FROM sakila.category 
    WHERE name LIKE '%me%'
    ORDER BY name ASC
    LIMIT 1; 
    ```
14. ```sql
    SELECT *
    FROM sakila.film
    WHERE 
        (title LIKE '%paced%' OR title LIKE '%of%') 
        AND 
        (release_year > 2000 OR length > 100); 
    ```
