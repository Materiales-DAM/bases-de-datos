---
cover: ../../../.gitbook/assets/join.png
coverY: 279.9386666666667
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

# Joins

En SQL, los JOIN son operaciones que combinan filas de dos o más tablas basándose en una condición relacionada entre ellas. Hay varios tipos de JOIN, y cada uno tiene un propósito específico. Aquí están los tipos más comunes de JOIN:

## **INNER JOIN**

Es uno de los tipos más comunes de JOIN en SQL y se utiliza para combinar filas de dos o más tablas basándose en una condición de coincidencia. La idea es devolver solo las filas que tienen al menos una coincidencia en ambas tablas. Aquí tienes una explicación detallada de cómo funciona:

<figure><img src="../../../.gitbook/assets/image (140).png" alt="" width="375"><figcaption></figcaption></figure>

#### Sintaxis básica

```sql
SELECT columnas
FROM tabla1
INNER JOIN tabla2 ON tabla1.columna = tabla2.columna;
```

* **`SELECT columnas`:** Especifica las columnas que deseas recuperar en el resultado de la consulta.
* **`FROM tabla1`:** Indica la primera tabla que estás seleccionando.
* **`INNER JOIN tabla2`:** Especifica la segunda tabla que estás uniendo y el tipo de JOIN que estás utilizando.
* **`ON tabla1.columna = tabla2.columna`:** Define la condición de coincidencia entre las dos tablas. Las filas se emparejarán si el valor en la columna de la tabla1 es igual al valor en la columna de la tabla2.
* Puedes tener múltiples condiciones de coincidencia en la cláusula `ON` para casos más complejos.
* INNER JOIN es el tipo de JOIN predeterminado, por lo que en muchos casos, simplemente puedes escribir `JOIN` en lugar de `INNER JOIN` sin afectar la lógica de la consulta.

#### Ejemplo

<figure><img src="../../../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

Mostras los profesores con su departamento

```sql
SELECT * FROM Profesor p INNER JOIN Departamento d ON p.CodigoDepartamento  = d.Codigo
```

```
Dni      |Nombre     |Categoria|Antiguedad|CodigoDepartamento|Codigo|Presupuesto|Habitacion|
---------+-----------+---------+----------+------------------+------+-----------+----------+
00000000X|Bob Esponja|JD       |        15|INF               |INF   |   10000.00|101       |
00000001X|Calamardo  |PS       |         5|INF               |INF   |   10000.00|101       |
00000002X|George Pig |PT       |         6|INF               |INF   |   10000.00|101       |
00000003X|Peppa Pig  |JD       |        15|MKT               |MKT   |   15000.00|102       |
00000004X|Pocoyo     |PS       |        10|MKT               |MKT   |   15000.00|102       |
```

## **LEFT JOIN (o LEFT OUTER JOIN)**

Este tipo de JOIN combina filas de dos tablas basándose en una condición de unión, pero incluye todas las filas de la tabla izquierda (o la primera tabla mencionada en la cláusula `LEFT JOIN`) incluso si no hay coincidencias en la tabla derecha (o la segunda tabla mencionada). En otras palabras, el `LEFT JOIN` devuelve todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha. Si no hay coincidencias, las columnas de la tabla derecha contendrán valores nulos.

<figure><img src="../../../.gitbook/assets/image (141).png" alt="" width="375"><figcaption></figcaption></figure>

Por ejemplo, si queremos listar todos los departamentos, añadiendo sus profesores haríamos:

```sql
SELECT * 
FROM 
    Departamento d LEFT JOIN Profesor p ON p.CodigoDepartamento  = d.Codigo
```

Esta consulta devolvería estas filas

```
Codigo|Presupuesto|Habitacion|Dni      |Nombre     |Categoria|Antiguedad|CodigoDepartamento|
------+-----------+----------+---------+-----------+---------+----------+------------------+
ADM   |    1500.00|103       |         |           |         |          |                  |
INF   |   10000.00|101       |00000000X|Bob Esponja|JD       |        15|INF               |
INF   |   10000.00|101       |00000001X|Calamardo  |PS       |         5|INF               |
INF   |   10000.00|101       |00000002X|George Pig |PT       |         6|INF               |
MKT   |   15000.00|102       |00000003X|Peppa Pig  |JD       |        15|MKT               |
MKT   |   15000.00|102       |00000004X|Pocoyo     |PS       |        10|MKT               |
```

El `LEFT JOIN` devuelve una fila por cada profesor en un departamento, y en el caso de departamentos sin profesores (ADM) devuelve una sola fila para ese departamento en la que los valores de las columnas de la tabla `Profesor` son null.

## **RIGHT JOIN (o RIGHT OUTER JOIN)**

Este tipo de JOIN funciona igual que el LEFT JOIN pero en sentido inverso.

Este tipo de JOIN combina filas de dos tablas basándose en una condición de unión, pero incluye todas las filas de la tabla derecha (o la segunda rimera tabla mencionada en la cláusula `LEFT JOIN`) incluso si no hay coincidencias en la tabla izquierda (o la primera tabla mencionada). En otras palabras, el `RIGHT JOIN` devuelve todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda. Si no hay coincidencias, las columnas de la tabla izquierda contendrán valores nulos.

<figure><img src="../../../.gitbook/assets/image (142).png" alt="" width="375"><figcaption></figcaption></figure>

Por ejemplo, si queremos listar todos los departamentos, añadiendo sus profesores haríamos:

```sql
SELECT * 
FROM 
    Orderador o RIGHT JOIN Departamento d ON o.CodigoDepartamento  = d.Codigo
```

Esta consulta devolvería estas filas

```
Id|Memoria|Procesador|CodigoDepartamento|Codigo|Presupuesto|Habitacion|
--+-------+----------+------------------+------+-----------+----------+
  |       |          |                  |ADM   |    1500.00|103       |
 1|      8|I5        |INF               |INF   |   10000.00|101       |
 2|     16|I7        |INF               |INF   |   10000.00|101       |
 3|      8|I5        |MKT               |MKT   |   15000.00|102       |
 4|      8|I5        |MKT               |MKT   |   15000.00|102       |
```

El `RIGHT JOIN` devuelve una fila por cada ordenador en un departamento, y en el caso de departamentos sin ordenadores (ADM) devuelve una sola fila para ese departamento en la que los valores de las columnas de la tabla `Ordenador` son null.

## **FULL JOIN (o FULL OUTER JOIN)**

El `FULL OUTER JOIN` es una operación en SQL que combina filas de dos tablas basándose en una condición de unión, pero a diferencia del `INNER JOIN` y el `LEFT JOIN`, incluye todas las filas tanto de la tabla izquierda como de la tabla derecha, sin importar si hay coincidencias o no.

En otras palabras, un `FULL OUTER JOIN` devuelve todas las filas de ambas tablas y rellena con valores nulos donde no hay coincidencias en las columnas de unión.

<figure><img src="../../../.gitbook/assets/image (143).png" alt="" width="375"><figcaption></figcaption></figure>

Por ejemplo, si queremos listar todos los departamentos, añadiendo sus profesores haríamos:

{% tabs %}
{% tab title="PostgreSQL" %}
```sql
SELECT * 
FROM 
    Profesor p FULL JOIN Departamento d ON p.CodigoDepartamento  = d.Codigo
```
{% endtab %}

{% tab title="MySQL" %}
Este tipo de JOIN no se puede realizar en MySQL
{% endtab %}
{% endtabs %}

Esta consulta devolvería estas filas

```
dni      |nombre     |categoria|antiguedad|codigodepartamento|codigo|presupuesto|habitacion|
---------+-----------+---------+----------+------------------+------+-----------+----------+
00000000X|Bob Esponja|JD       |        15|INF               |INF   |   10000.00|101       |
00000001X|Calamardo  |PS       |         5|INF               |INF   |   10000.00|101       |
00000002X|George Pig |PT       |         6|INF               |INF   |   10000.00|101       |
00000003X|Peppa Pig  |JD       |        15|MKT               |MKT   |   15000.00|102       |
00000004X|Pocoyo     |PS       |        10|MKT               |MKT   |   15000.00|102       |
00000005X|Elly       |PS       |         5|                  |      |           |          |
         |           |         |          |                  |ADM   |    1500.00|103       |
```

El `RIGHT JOIN` devuelve una fila por cada ordenador en un departamento, y en el caso de departamentos sin ordenadores (ADM) devuelve una sola fila para ese departamento en la que los valores de las columnas de la tabla `Ordenador` son null.

## **CROSS JOIN**

Un "cross join" (unión cruzada) en SQL es una operación que combina cada fila de una tabla con cada fila de otra tabla, creando así un conjunto de resultados que es el producto cartesiano de ambas tablas. En otras palabras, cada fila de la primera tabla se combina con todas las filas de la segunda tabla.

<figure><img src="../../../.gitbook/assets/image (2) (1) (1) (1) (1) (1).png" alt=""><figcaption><p>En el producto cartesiano se combinan todas las filas de la izquierda con todas las de la derecha</p></figcaption></figure>

El resultado de este tipo de JOIN es el mismo que en el [producto de tablas](../producto-de-tablas/), por lo que podemos usarlos indistintamente. Es posible deshacer el producto cartesiano resultante usando la cláusula WHERE.

```sql
SELECT * 
FROM 
    Profesor p CROSS JOIN Departamento d 
WHERE p.CodigoDepartamento  = d.Codigo
```

Esta consulta devolvería estas filas (como un INNER JOIN)

```
Dni      |Nombre     |Categoria|Antiguedad|CodigoDepartamento|Codigo|Presupuesto|Habitacion|
---------+-----------+---------+----------+------------------+------+-----------+----------+
00000000X|Bob Esponja|JD       |        15|INF               |INF   |   10000.00|101       |
00000001X|Calamardo  |PS       |         5|INF               |INF   |   10000.00|101       |
00000002X|George Pig |PT       |         6|INF               |INF   |   10000.00|101       |
00000003X|Peppa Pig  |JD       |        15|MKT               |MKT   |   15000.00|102       |
00000004X|Pocoyo     |PS       |        10|MKT               |MKT   |   15000.00|102       |
```

## **SELF JOIN**

Un "self join" es una operación en SQL donde una tabla se une a sí misma. Esto significa que en una consulta SQL, una tabla aparece dos veces, una vez como la tabla principal y otra vez como una tabla que se está uniendo a sí misma.

El propósito principal de un "self join" es comparar filas dentro de la misma tabla. Esto puede ser útil en situaciones donde hay relaciones entre las filas de la misma tabla que necesitan ser exploradas o cuando se necesita comparar información dentro de la misma entidad.

<figure><img src="../../../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption><p>La tabla A se cruza con ella misma</p></figcaption></figure>

No existe una sintáxis específica para hacer un "self join", simplemente se pone la misma tabla a izquierda y derecha del join. De hecho, se pueden realizar self joins de todo tipo: inner, left, right, full o cross.



Por ejemplo, si quisiéramos hacer parejas de ordenadores que tuvieran el mismo procesador&#x20;

```sql
SELECT *
FROM Ordenador o1
INNER JOIN Ordenador o2 ON o1.procesador = o2.procesador
ORDER BY o1.id, o2.id;
```

El resultado de esta query es

{% code lineNumbers="true" %}
```
Id|Memoria|Procesador|CodigoDepartamento|Id|Memoria|Procesador|CodigoDepartamento|
--+-------+----------+------------------+--+-------+----------+------------------+
 1|      8|I5        |INF               | 1|      8|I5        |INF               |
 1|      8|I5        |INF               | 3|      8|I5        |MKT               |
 1|      8|I5        |INF               | 4|      8|I5        |MKT               |
 2|     16|I7        |INF               | 2|     16|I7        |INF               |
 3|      8|I5        |MKT               | 1|      8|I5        |INF               |
 3|      8|I5        |MKT               | 3|      8|I5        |MKT               |
 3|      8|I5        |MKT               | 4|      8|I5        |MKT               |
 4|      8|I5        |MKT               | 1|      8|I5        |INF               |
 4|      8|I5        |MKT               | 3|      8|I5        |MKT               |
 4|      8|I5        |MKT               | 4|      8|I5        |MKT               |
```
{% endcode %}

Este self join está generando algunas filas indeaseadas:

* En las filas de las líneas 3, 6, 8 y 12, o1 y o2 son la misma fila
* El resto de filas están duplicando el match cambiando el orden de o1 y o2. Por ejemplo, las filas 4 y 7 contienen la misma información pero cambiando o1 por o2.

Para hacer desaparecer estas líneas duplicadas y automatcheadas, vamos a añadir otra condición al INNER JOIN, esta condición dirá que solo macheamos cuando el id de o1 es mayor que el id de o2.

```sql
SELECT *
FROM Ordenador o1
INNER JOIN Ordenador o2 ON o1.procesador = o2.procesador AND o1.id > o2.id
ORDER BY o1.id, o2.id;
```

Gracias a este cambio obtenemos un resultado sin automatches ni duplicados

```
Id|Memoria|Procesador|CodigoDepartamento|Id|Memoria|Procesador|CodigoDepartamento|
--+-------+----------+------------------+--+-------+----------+------------------+
 3|      8|I5        |MKT               | 1|      8|I5        |INF               |
 4|      8|I5        |MKT               | 1|      8|I5        |INF               |
 4|      8|I5        |MKT               | 3|      8|I5        |MKT               |
```
