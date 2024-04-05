---
cover: ../../../.gitbook/assets/join.png
coverY: 262.56266666666664
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

# Soluciones fechas

1. La fecha y hora de alquiler de las películas en la tabla `rental`.

```sql
SELECT 
	TIME(r.rental_date) as rental_time,
	DATE(r.rental_date) as rental_date
FROM 
	rental r;
```

2.  El año de creación de los clientes en la tabla `customer`.

    ```sql
    SELECT 
    	YEAR(c.create_date) as create_year
    FROM
    	customer c ;
    ```
3.  El mes en que se devolvió cada película en la tabla `rental`.

    ```sql
    SELECT 
    	MONTH(r.return_date) AS return_month
    FROM
    	rental r;
    ```
4.  El día de la semana en que se realizó cada alquiler en la tabla `rental`.

    ```sql
    SELECT 
    	WEEKDAY(rental_date) AS rental_weekday
    FROM
    	rental r;
    ```
5.  La fecha de devolución más antigua registrada en la tabla `rental`.

    ```sql
    SELECT 
    	MIN(return_date) as return_date
    FROM
    	rental r ;
    ```
6.  La fecha de devolución más tardía registrada en la tabla `rental`.

    ```sql
    SELECT 
    	MAX(return_date) as return_date
    FROM
    	rental r ;
    ```
7.  El número total de alquileres por mes en la tabla `rental`.

    ```sql
    SELECT
    	MONTH(r.rental_date) as month,
    	COUNT(*)
    FROM
    	rental r 
    GROUP BY month;
    ```
8.  El día de la semana en que se realizaron el máximo de pagos en la tabla `payment`.

    ```sql
    SELECT 
    	WEEKDAY(p.payment_date) AS week_day,
    	COUNT(*) as payments
    FROM
    	payment p
    GROUP BY week_day
    ORDER BY payments DESC
    LIMIT 1;
    ```
9.  El mes en que se alquiló la mayor cantidad de películas en la tabla `rental`.

    ```sql
    SELECT
    	MONTH(rental_date) as month,
    	COUNT(*) as rentals
    FROM
    	rental
    GROUP BY month
    ORDER BY rentals DESC
    LIMIT 1;
    ```
