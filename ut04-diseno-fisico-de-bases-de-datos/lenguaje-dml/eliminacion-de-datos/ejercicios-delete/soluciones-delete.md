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

# Soluciones DELETE



1.

    ```sql
    DELETE FROM film
    WHERE release_year < 2005;
    ```
2.

    ```sql
    DELETE FROM payment
    WHERE amount BETWEEN 5.00 AND 10.00;
    ```
3.

    ```sql
    DELETE FROM rental
    WHERE rental_date = '2023-01-01'; 
    ```
4.

    ```sql
    DELETE FROM film 
    WHERE description LIKE '%Comedy%'; 
    ```
5.

    <pre class="language-sql"><code class="lang-sql"><strong># Da error de foreign key, ignorarlo
    </strong><strong>DELETE FROM film
    </strong>WHERE rating != 'G';
    </code></pre>
6.

    ```sql
    ```
7.

    ```sql
    ```
8.

    ```sql
    ```
9.

    ```sql
    ```
10.

    ```sql
    ```
11.

    ```sql
    ```
12.

    ```sql
    ```
13.

    ```sql
    ```
14.

    ```sql
    ```
15.

    ```sql
    ```

