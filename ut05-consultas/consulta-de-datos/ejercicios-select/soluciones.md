---
cover: ../../../.gitbook/assets/select.png
coverY: 0
layout:
  cover:
    visible: true
    size: hero
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

# Soluciones

1\.

```sql
SELECT description
FROM film 
WHERE description LIKE '%Adventure%' OR description LIKE '%Action%' 
ORDER BY title;
```

2\.

```sql
SELECT *
FROM category
WHERE name = 'Drama' OR name = 'Music'
ORDER BY name ASC;
```

3\.

```sql
SELECT city
FROM city
WHERE country_id = 1 or country_id = 2
ORDER BY city DESC;
```

4\.

```sql
SELECT first_name, last_name
FROM customer 
WHERE email IS NOT NULL
ORDER BY last_name ASC;
```

5\.

```sql
SELECT address
FROM address 
WHERE postal_code LIKE '48%' AND district = 'California'
ORDER BY city_id DESC;
```

6\.

```sql
SELECT *
FROM language
WHERE name = 'Spanish' or name = 'French'
ORDER BY name ASC;
```

7\.

```sql
SELECT Name
FROM country 
WHERE Continent = 'Europe' OR Continent = 'Asia'
ORDER BY Name DESC;
```

8\.

```sql
SELECT name
FROM category
WHERE LENGTH(name) > 10 OR name LIKE 'A%'
ORDER BY name;
```

9\.

```sql
SELECT name
FROM category 
WHERE name = 'Action' or name = 'Travel'
ORDER BY name;
```

10\.

```sql
select first_name, last_name
FROM staff 
WHERE picture IS NOT NULL AND (store_id  = 1 OR store_id = 2)
ORDER BY last_name ASC;
```

11\.

```sql
SELECT first_name, last_name
FROM customer 
ORDER BY last_name 
OFFSET 50
LIMIT 50;
```

12\.

```sql
SELECT title, description
FROM film
WHERE `length`  >120
ORDER BY `length` DESC, title 
LIMIT 10
OFFSET 30;
```

13\.

```sql
SELECT name
FROM category 
WHERE name LIKE '%me%'
ORDER BY name 
LIMIT 1;
```

14\.

```sql
SELECT *
FROM film 
WHERE  
	(title LIKE '%Paced%' OR title LIKE '%of%')
	AND
	(release_year > 2000 OR `length` > 100);
```
