---
cover: ../../.gitbook/assets/select.png
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

# LIMIT y OFFSET

Las cláusulas `OFFSET` y `LIMIT` se utilizan en conjunto con la sentencia `SELECT` para controlar la cantidad de filas devueltas por una consulta y para paginación de resultados.

## **LIMIT**

La cláusula `LIMIT` se utiliza para especificar el número máximo de filas que se deben devolver en el resultado de una consulta.

Su sintaxis básica es: `LIMIT n`, donde "n" es el número de filas que se desea obtener.

```sql
SELECT columna1, columna2
FROM nombre_tabla
LIMIT 10;
```

Este ejemplo devolverá las primeras 10 filas del resultado de la consulta.

## **OFFSET**

La cláusula `OFFSET` se utiliza para especificar el número de filas que se deben omitir desde el principio del conjunto de resultados. Su sintaxis básica es: `OFFSET n`, donde "n" es el número de filas que se deben omitir.

La claúsula OFFSET se debe usar en combinación con ORDER BY, para que la ordenación sea por un criterio claro.

Por ejemplo:

```sql
SELECT columna1, columna2
FROM nombre_tabla
ORDER BY columna1
OFFSET 5;
```

Este ejemplo omitirá las primeras 5 filas del conjunto de resultados ordenados por columna1.

## **Paginación con LIMIT y OFFSET**

La paginación en SQL se refiere al proceso de dividir un conjunto de resultados de una consulta en bloques más pequeños o "páginas". Esto es especialmente útil cuando se trabaja con grandes conjuntos de datos y se desea mostrar resultados de manera escalonada, permitiendo a los usuarios navegar a través de las páginas de resultados en lugar de cargar toda la información de una sola vez. La paginación es comúnmente implementada mediante el uso de las cláusulas `LIMIT` y `OFFSET` (o sus equivalentes, dependiendo de la base de datos) en combinación con consultas SQL.

Lo primero que se debe decidir es el tamaño de página que se desea, este valor será lo que ponemos en LIMIT. El OFFSET se calcula con esta fórmula OFFEST = (NumPágina-1) \* TamañoPágina&#x20;

Por ejemplo:

```sql
SELECT columna1, columna2
FROM nombre_tabla
ORDER BY columna1
LIMIT 10 OFFSET 10;
```

Este ejemplo crea páginas de 10 elementos y selecciona la segunda página.

Es importante tener en cuenta que el uso de `OFFSET` y `LIMIT` puede afectar el rendimiento en grandes conjuntos de datos, ya que la base de datos debe cargar y procesar todas las filas antes de aplicar estas cláusulas. En algunas bases de datos, hay otras formas de lograr paginación más eficiente, como el uso de `FETCH` y `OFFSET` en lugar de `LIMIT` y `OFFSET`.
