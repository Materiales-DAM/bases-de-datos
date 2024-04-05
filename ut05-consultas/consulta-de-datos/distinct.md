---
cover: ../../.gitbook/assets/join.png
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

# DISTINCT

La cláusula DISTINCT se utiliza en una consulta SELECT para eliminar filas duplicadas de un conjunto de resultados. Funciona de la siguiente manera:

Cuando realizas una consulta SELECT en una tabla que puede contener filas duplicadas, puedes agregar la palabra clave DISTINCT justo después de SELECT para indicar que solo deseas que se devuelvan valores únicos para las columnas seleccionadas.

Por ejemplo, si quisiéramos ver los años en los que se han sacado película en la base de datos Sakila podríamos hacer:

```sql
SELECT release_year FROM film;
```

Esta consulta devolverá una lista con los release\_year de cada película, habrá tantas filas como películas .

Sin embargo, si lo que se desea es ver en qué años se ha sacado alguna película, se debe agregar la cláusula DISTINCT:

```sql
SELECT DISTINCT release_year FROM film;
```

Esta consulta devolverá una lista de años sin repeticiones. Si hay múltiples registros con el mismo release\_year, solo se incluirá una vez en el conjunto de resultados.

Es importante tener en cuenta que DISTINCT **opera en todas las columnas seleccionadas** en la consulta. Por ejemplo, si tienes una consulta SELECT con múltiples columnas y usas DISTINCT, las combinaciones únicas de valores para todas las columnas seleccionadas se considerarán para eliminar duplicados.
