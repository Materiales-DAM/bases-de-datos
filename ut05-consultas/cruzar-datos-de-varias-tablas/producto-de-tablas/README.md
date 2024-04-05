---
cover: ../../../.gitbook/assets/join.png
coverY: 376.472
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

# Producto de tablas

Es posible cruzar los datos de varias tablas en una misma sentencia SQL poniendo las tablas que deseemos en la cláusula FROM y añadiendo a la claúsula WHERE la relación entre las tablas.

**Alias de tablas**

Es posible asignar a cada tabla un nombre (alias) con el que referenciar a sus columnas en el resto de la query. En este ejemplo, se utilizan alias (`c` y `p`) para abreviar los nombres de las tablas. La condición en la cláusula `WHERE` establece una relación entre las tablas, evitando así un producto cartesiano y seleccionando solo las filas que cumplen con la condición.

```sql
SELECT *
FROM Departamento d, Ordenador o
WHERE o.CodigoDepartamento = d.Codigo;
```

El resultado de esta consulta combinará todas las columnas de la tabla clientes y pedidos, vinculando cada cliente con sus pedidos

<figure><img src="../../../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

Podríamos cruzar los datos de las siguientes maneras:

* Mostras los profesores con su departamentos

```sql
SELECT * FROM Profesor p, Departamento d WHERE p.CodigoDepartamento  = d.Codigo
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

* Mostrar ordenadores con su departamento

```sql
SELECT * FROM Ordenador o, Departamento d WHERE o.CodigoDepartamento  = d.Codigo 
```

```
Id|Memoria|Procesador|CodigoDepartamento|Codigo|Presupuesto|Habitacion|
--+-------+----------+------------------+------+-----------+----------+
 1|      8|I5        |INF               |INF   |   10000.00|101       |
 2|     16|I7        |INF               |INF   |   10000.00|101       |
 3|      8|I5        |MKT               |MKT   |   15000.00|102       |
 4|      8|I5        |MKT               |MKT   |   15000.00|102       |
```

### **Cruce de varias tablas sin una condición explícita (Producto Cartesiano)**

U producto cartesiano se refiere a una operación que combina cada fila de una tabla con cada fila de otra tabla, generando un conjunto de resultados que contiene todas las posibles combinaciones de filas entre las tablas involucradas.



<figure><img src="../../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

Por ejemplo, la siguiente consulta devolverá el producto cartesiano de las filas de `Profesor` y `Departamento`, es decir, todas las combinaciones posibles entre ellas.

```sql
SELECT *
FROM Profesor p, Departamento d;
```

El resultado de esta consulta produce tantas filas como todas las combinaciones entre los valores de las filas de `Profesor` y `Departamento`.  A esta combinación de todas las filas de ambas tablas se le denomina producto cartesiano.

```
Dni      |Nombre     |Categoria|Antiguedad|CodigoDepartamento|Codigo|Presupuesto|Habitacion|
---------+-----------+---------+----------+------------------+------+-----------+----------+
00000000X|Bob Esponja|JD       |        15|INF               |MKT   |   15000.00|102       |
00000000X|Bob Esponja|JD       |        15|INF               |INF   |   10000.00|101       |
00000000X|Bob Esponja|JD       |        15|INF               |ADM   |    1500.00|103       |
00000001X|Calamardo  |PS       |         5|INF               |MKT   |   15000.00|102       |
00000001X|Calamardo  |PS       |         5|INF               |INF   |   10000.00|101       |
00000001X|Calamardo  |PS       |         5|INF               |ADM   |    1500.00|103       |
00000002X|George Pig |PT       |         6|INF               |MKT   |   15000.00|102       |
00000002X|George Pig |PT       |         6|INF               |INF   |   10000.00|101       |
00000002X|George Pig |PT       |         6|INF               |ADM   |    1500.00|103       |
00000003X|Peppa Pig  |JD       |        15|MKT               |MKT   |   15000.00|102       |
00000003X|Peppa Pig  |JD       |        15|MKT               |INF   |   10000.00|101       |
00000003X|Peppa Pig  |JD       |        15|MKT               |ADM   |    1500.00|103       |
00000004X|Pocoyo     |PS       |        10|MKT               |MKT   |   15000.00|102       |
00000004X|Pocoyo     |PS       |        10|MKT               |INF   |   10000.00|101       |
00000004X|Pocoyo     |PS       |        10|MKT               |ADM   |    1500.00|103       |
```

Normalmente nunca vamos a querer que una consulta realice un producto cartesiano como el que hemos visto, para evitarlo debemos añadir alguna condición con la cláusula WHERE que filtre aquellas combinaciones que son interesantes pra nosotros

