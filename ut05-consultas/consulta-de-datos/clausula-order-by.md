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

# Cláusula ORDER BY

La cláusula ORDER BY  se utiliza para ordenar los resultados de una consulta en función de uno o más campos de una tabla.&#x20;

La sintaxis básica de `ORDER BY` es la siguiente:

```sql
SELECT column1, column2, ...
FROM tableName
ORDER BY column1 [ASC | DESC], column2 [ASC | DESC], ...;
```

* `column1, column2, ...`: Los nombres de las columnas que deseas seleccionar en tu consulta.
* `FROM tableName`: La tabla de la cual estás seleccionando datos.
* `ORDER BY column1 [ASC | DESC], column2 [ASC | DESC], ...`: Especifica uno o más campos por los cuales deseas ordenar los resultados. Puedes especificar el orden ascendente (`ASC` por defecto) o descendente (`DESC`).

Ejemplos:

1. Ordenar resultados en orden ascendente por una columna:

```sql
SELECT nombre, edad
FROM empleados
ORDER BY edad;
```

2. Ordenar resultados en orden descendente por una columna:

```sql
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC;
```

3. Ordenar resultados por múltiples columnas:

```sql
SELECT nombre, edad, salario
FROM empleados
ORDER BY edad ASC, salario DESC;
```

En este último ejemplo, los resultados se ordenarán primero por la columna `edad` de forma ascendente y, en caso de empate, por la columna `salario` de forma descendente.

En resumen, `ORDER BY` es una herramienta útil para organizar los resultados de tus consultas SQL de acuerdo con tus requisitos específicos. Puedes especificar el orden de clasificación para cada columna individualmente y también ordenar por múltiples columnas.
