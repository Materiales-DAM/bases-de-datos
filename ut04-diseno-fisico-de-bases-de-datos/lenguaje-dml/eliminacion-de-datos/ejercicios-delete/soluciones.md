---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Soluciones

1\.

```sql
DELETE FROM film WHERE release_year < 2005;
```

2\.

```sql
DELETE FROM payment WHERE amount BETWEEN 5 AND 10;
```

3\.

```sql
DELETE FROM rental WHERE rental_date = '2023-01-01';
```

4\.

```sql
DELETE FROM film WHERE description LIKE '%Comedia%';
```

5\.

```sql
DELETE FROM film WHERE rating != 'G';
```

6\.

```sql
DELETE FROM actor WHERE last_name LIKE 'A%';
```

7\.

```sql
DELETE FROM film WHERE release_year > 2010 AND length < 120;
```

8\.

```sql
DELETE FROM film WHERE title NOT LIKE '%action%';
```

9\.

```sql
DELETE FROM customer WHERE email IS NULL OR create_date < '1980/01/01';
```

10\.

```sql
DELETE FROM film WHERE rating IS NULL;
```

11\.

```sql
DELETE FROM customer WHERE first_name NOT LIKE 'M%';
```

12\.

```sql
DELETE FROM film WHERE length = 120 OR rating = 'PG-13'; 
```

13\.

```sql
DELETE FROM actor WHERE first_name LIKE '%test%';
```

14\.

```sql
DELETE FROM rental WHERE rental_date > '2023-01-01' AND return_date IS NULL;
```

15\.

```sql
DELETE FROM film WHERE description LIKE '%drama%' OR release_year < 2000;
```

