---
cover: ../../.gitbook/assets/aggregation.png
coverY: 36.37866666666667
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

# Agregaciones por grupos

En la mayor parte de ocasiones, vamos a querer realizar las agregaciones agrupando filas que comparten algo en común.

Por ejemplo, considera la siguiente tabla `sale`:

| customer\_id | product  | amount | price |
| ------------ | -------- | ------ | ----- |
| 1            | Tornillo | 2      | 10.00 |
| 1            | Tuerca   | 3      | 15.00 |
| 2            | Tornillo | 2      | 10.00 |
| 2            | Tuerca   | 2      | 15.00 |
| 1            | Tornillo | 4      | 10.00 |

Si quisiéramos saber cuánto ha gastado cada cliente tendríamos que agrupar las filas de un mismo cliente y agregarlas por separado sumando el resultado de multiplicar la cantidad por el precio del artículo de cada venta.

## Group by (agrupación)

La cláusula `GROUP BY` en SQL se utiliza para agrupar filas que tienen los mismos valores en una o más columnas y aplicar funciones de agregación a esas filas agrupadas. Esta cláusula se combina frecuentemente con funciones de agregación como `SUM()`, `AVG()`, `COUNT()`, `MAX()`, `MIN()`, entre otras, para realizar cálculos sobre grupos de datos.

Cuando se utiliza la cláusula `GROUP BY`, las filas se agrupan en conjuntos basados en los valores de las columnas especificadas en la cláusula `GROUP BY`. Luego, las funciones de agregación se aplican a cada grupo por separado, produciendo un solo resultado por grupo.

```sql
SELECT customer_id, SUM(amount * price) AS spent
FROM sale
GROUP BY customer_id;
```

<table><thead><tr><th width="156">customer_id</th><th>spent</th></tr></thead><tbody><tr><td>1</td><td>105.00</td></tr><tr><td>2</td><td>50.00</td></tr></tbody></table>

Una agrupación puede realizarse por uno o varias columnas, cuantas más columnas añadamos más grupos obtendremos como resultado.

Por ejemplo, podríamos agrupar por cliente y producto, de forma que calculemos cuanto se ha gastado cada cliente en un determinado producto

```sql
SELECT customer_id, product, SUM(amount * price) AS spent
FROM sale
GROUP BY customer_id, product;
```

<table><thead><tr><th width="162">customer_id</th><th>product</th><th>spent</th></tr></thead><tbody><tr><td>1</td><td>Tornillo</td><td>60.00</td></tr><tr><td>1</td><td>Tuerca</td><td>45.00</td></tr><tr><td>2</td><td>Tornillo</td><td>20.00</td></tr><tr><td>2</td><td>Tuerca</td><td>30.00</td></tr></tbody></table>

En las queries de agregación solo se pueden seleccionar columnas que formen parte de la cláusula GROUP BY, columnas cuyo valor sea único para toda la agrupación y columnas calculadas aplicando una función de agregación sobre otra columna que no sea parte del GROUP BY. Lo habitual es poner primero las columnas del GROUP BY (ya que identifican al grupo) y después  funciones de agregación aplicadas a otras columnas.

```sql
-- Esta consulta NO es correcta ya que se selecciona la columna product, pero no
-- forma parte de la cláusula GROUP BY
SELECT 
    customer_id, 
    product, 
    SUM(amount * price) AS spent
FROM sale
GROUP BY customer_id;

-- Esta consulta SÍ es correcta las columnas seleccionadas forman parte del GROUP BY
-- y el resto son columnas cal
SELECT 
    customer_id, 
    product, 
    SUM(amount * price) AS spent,
    COUNT(*) AS num_sales
FROM sale
GROUP BY customer_id, product;
```

## Having

La cláusula `HAVING` se utiliza junto con la cláusula `GROUP BY` para filtrar los resultados de una consulta de agrupación basándose en condiciones de agregación. Es decir, la cláusula `HAVING` se utiliza para filtrar filas  ya agregadas.

Por ejemplo, supongamos que queremos obtener los clientes que se han gastado más de 100$ en sus compras

```sql
SELECT 
    customer_id, 
    SUM(amount * price) AS spent
FROM sales
GROUP BY customer_id
HAVING SUM(amount * price) > 100;
```

En este ejemplo, la cláusula `HAVING` se utiliza para filtrar los resultados después de que se han agrupado las filas por cliente. Solo se incluirán los grupos cuya gasto total en compras (`SUM(amount * price)`) sea mayor que 100.

En resumen, la cláusula `HAVING` se utiliza para filtrar grupos resultantes de una agrupación, basándose en condiciones aplicadas sobre columnas calculadas con alguna función de agregación.

#### HAVING vs WHERE

La diferencia principal entre las cláusulas `HAVING` y `WHERE` radica en el momento en el que se aplican:

* **WHERE**: Se utiliza para filtrar filas individuales **antes de que se realice la agrupación** (si la hay). Las condiciones de la cláusula WHERE se aplican sobre columnas de la tabla.
* **HAVING**: Se utiliza para filtrar  filas ya agrupadas **después de que haya realizado la agrupación**. Las condiciones de la claúsula HAVING se aplican sobre el resultado de aplicar una función de agregación.

Por ejemplo, si quisiera consultar cuántas ventas de más de 10$ ha realizado cada cliente usaría la cláusula WHERE. Esto se debe a que el filtro debe aplicarse a cada fila de la tabla de ventas antes de realizar la agregación para obtener el resultado

```sql
SELECT 
    customer_id, 
    COUNT(*) AS num_sales_bigger_than_10
FROM sales
WHERE price > 10
GROUP BY customer_id;
```

Sin embargo, si lo que quiero consultar es los clientes que EN TOTAL han gastado más de 100, debo utilizar la cláusula HAVING ya que el filtro se debe realizar DESPUÉS de la agregación

```sql
SELECT 
    customer_id, 
    SUM(amount * price) AS spent
FROM sales
GROUP BY customer_id
HAVING SUM(amount * price) > 100;
```

Es posible combinar WHERE y HAVING en una misma consulta. Por ejemplo, si quisiera consultar los clientes que han hecho más de 5 compras con un precio superior a 10&#x20;

```sql
SELECT 
    customer_id, 
    COUNT(*) AS num_sales_bigger_than_10
FROM sales
WHERE price > 10
GROUP BY customer_id
HAVING COUNT(*) > 5;
```

