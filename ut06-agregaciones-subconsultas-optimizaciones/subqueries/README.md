---
cover: ../../.gitbook/assets/subquery.gif
coverY: -843.7013333333334
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

# Subqueries

Una subconsulta (o subquery) en SQL es una consulta anidada dentro de otra consulta SQL más grande. Se utiliza para realizar consultas más complejas y obtener resultados más específicos al filtrar datos de una o varias tablas.

Por ejemplo, podríamos usar una subconsulta para obtener todos los clientes que han hecho al menos un pedido después de la fecha '2024-01-01'.

```sql
SELECT *
FROM Clientes
WHERE id_cliente IN (SELECT id_cliente
                     FROM Pedidos
                     WHERE fecha_pedido > '2024-01-01');
```

## Dónde se puede poner una subconsulta

Una subconsulta en SQL es una consulta anidada dentro de otra consulta SQL más grande. Se utiliza para realizar consultas más complejas y obtener resultados más específicos al filtrar datos de una o varias tablas.

### **En la cláusula WHERE**

Se utiliza para filtrar filas basadas en una condición específica.

<pre class="language-sql"><code class="lang-sql">SELECT *
FROM Clientes
<strong>WHERE id_cliente IN (SELECT id_cliente
</strong>                     FROM Pedidos
                     WHERE fecha_pedido > '2024-01-01');
</code></pre>

El resultado de la subconsulta se puede

1.  **Operadores de comparación (`=, >`, `<=`, `>=`, `!=`, `<>`)**: Se utilizan para comparar dos valores. Estos operadores solo pueden usarse con **subconsultas escalares** (devuelven un único valor).&#x20;

    ```sql
    SELECT name 
    FROM employees 
    WHERE department_id = 
        (SELECT id FROM departments WHERE name = 'IT');
    ```
2.  **Operador \[NOT] IN**: Permite verificar si un valor está contenido (o no) en el resultado de la subconsulta.

    ```sql
    -- Devuelve film_id de las películas cuya categoría contenga la letra a en el nombre
    SELECT DISTINCT film_id
    FROM film_category 
    WHERE category_id IN 
        (SELECT category_id FROM category WHERE name LIKE '%a%');
    ```
3.  **Operador \[NOT] EXISTS**: Se utiliza para verificar si existe al menos una fila (o no) en el resultado de una subconsulta

    ```sql
    SELECT name 
    FROM employees 
    WHERE EXISTS 
        (SELECT * FROM salaries WHERE employee_id = employees.id AND amount > 50000);
    ```
4.  **Operador  ALL**: Se utilizan para comparar un valor con todos los valores devueltos por una subconsulta.

    ```sql
    SELECT name 
    FROM products 
    WHERE price > ALL 
        (SELECT price FROM products WHERE category_id = 1);
    ```
5. **Operadores ANY/SOME**: Se utilizan para comparar un valor con al menos uno de los valores devueltos por una subconsulta.

```sql
SELECT name 
FROM products 
WHERE price > ANY 
    (SELECT price FROM products WHERE category_id = 2);
```

Estos operadores de subconsulta permiten realizar comparaciones, filtrados y cálculos más complejos dentro de una consulta SQL, brindando una gran flexibilidad para recuperar datos específicos de una base de datos.

### En la cláusula FROM

Se utiliza para definir una tabla temporal que se puede usar en la consulta principal.

Por ejemplo, supongamos que tenemos la siguiente tabla order

| order\_id | customer\_id | order\_date |
| --------- | ------------ | ----------- |
| 1         | 1            | 2024-03-01  |
| 2         | 1            | 2024-03-02  |
| 3         | 2            | 2024-03-02  |
| 4         | 3            | 2024-03-03  |
| 5         | 3            | 2024-03-04  |
| 6         | 3            | 2024-03-04  |
| 7         | 4            | 2024-03-05  |
| 8         | 4            | 2024-03-05  |
| 9         | 4            | 2024-03-05  |
| 10        | 5            | 2024-03-06  |

Si queremos calcular la media de pedidos por cliente, podríamos usar una subconsulta en la cláusula FROM

```sql
SELECT AVG(orders_per_customer.order_count) AS average_orders
FROM (
    SELECT 
        customer_id, 
        COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) AS orders_per_customer;
```



El resultado de la subconsulta se carga en una "tabla temporal" a la que asignamos el alias order\_counts

| customer\_id | order\_count |
| ------------ | ------------ |
| 1            | 2            |
| 2            | 1            |
| 3            | 3            |
| 4            | 3            |
| 5            | 1            |

Finalmente, se aplica sobre estos datos una agregación que calcula la media de pedidos por cliente

| average\_orders |
| --------------- |
| 2               |

### En la cláusula SELECT

Una subconsulta en la cláusula `SELECT` se utiliza para devolver un solo valor o un conjunto de valores que se utilizarán en la consulta principal para realizar cálculos o para proporcionar información adicional en el conjunto de resultados.

Por ejemplo, si quisiéramos añadir la media del precio de productos a todas las filas podríamos hacer una subconsulta en la SELECT

```sql
SELECT 
    product_name, 
    price,
    (SELECT AVG(price) FROM products) AS average_price
FROM 
    products;
```

### En la cláusula HAVING

Se utiliza para filtrar grupos de filas basadas en una condición de grupo.

Por ejemplo, se puede usar para filtrar aquellos clientes que hayan gastado en total más que el promedio por pedido.

```sql
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > (SELECT AVG(amount) FROM orders);
```

## Subqueries correlacionadas

Una subquery correlacionada depende de la consulta externa para su ejecución. Es decir, la subquery hace referencia a una columna de la tabla de la consulta externa.

```sql
-- Esta consulta lista los clientes que han hecho algún pedido
SELECT c.customer_id, c.name
FROM customer c
WHERE customer_id in (
    SELECT o.customer_id
    FROM order o
    WHERE o.customer_id = c.customer_id
);
```

Las subconsultas correlacionadas pueden presentar problemas de rendimiento en comparación con otras técnicas de consulta debido a su naturaleza y la forma en que interactúan con la base de datos. Aquí hay algunas razones por las que las subconsultas correlacionadas pueden afectar el rendimiento:

1. **Ejecución repetida:** En una subconsulta correlacionada, la subconsulta se ejecuta una vez por cada fila del conjunto de resultados de la consulta principal. Esto puede resultar en un mayor número de operaciones de consulta y un mayor tiempo de ejecución en comparación con otras técnicas de consulta.
2. **Dependencia de índices:** Las subconsultas correlacionadas pueden hacer que los índices no se utilicen de manera efectiva. Esto se debe a que los valores de las columnas de la tabla externa pueden no estar disponibles para el optimizador de consultas cuando está evaluando la subconsulta.
3. **Optimización limitada:** Los sistemas de gestión de bases de datos (DBMS) pueden tener dificultades para optimizar consultas con subconsultas correlacionadas debido a la dependencia entre la subconsulta y la consulta principal. Esto puede llevar a planes de ejecución subóptimos y un rendimiento deficiente.
4. **Costo computacional:** La ejecución repetida de la subconsulta puede generar un alto costo computacional, especialmente si la subconsulta realiza operaciones complejas o accede a grandes volúmenes de datos.
5. **Escalabilidad limitada:** A medida que el tamaño de los conjuntos de datos aumenta, el impacto de las subconsultas correlacionadas en el rendimiento puede volverse más significativo. El aumento en el número de filas en la consulta principal puede conducir a un aumento exponencial en la cantidad de veces que se ejecuta la subconsulta.

Para mejorar el rendimiento cuando se enfrenta a problemas de rendimiento debido a subconsultas correlacionadas, a menudo se recomienda buscar alternativas como el uso de joins, expresiones de tabla comunes (CTE), o reescribir la consulta de manera que reduzca la necesidad de subconsultas correlacionadas. Además, ajustar los índices y optimizar las consultas puede ayudar a mitigar algunos de los problemas de rendimiento asociados con las subconsultas correlacionadas.
