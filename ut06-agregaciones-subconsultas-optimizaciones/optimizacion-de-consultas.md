---
cover: ../.gitbook/assets/optimization.jpg
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

# Optimización de consultas

La optimización de consultas en SQL es el proceso de mejorar el rendimiento de las consultas SQL para que se ejecuten de manera más eficiente. Cuando ejecutas una consulta SQL en una base de datos, el motor de base de datos necesita determinar la forma más eficiente de obtener los resultados solicitados. La optimización de consultas implica encontrar la mejor manera de recuperar y procesar los datos solicitados para minimizar el tiempo de ejecución y los recursos utilizados.

Hay varias técnicas y estrategias que se pueden utilizar para optimizar consultas en SQL:

1. **Uso de índices**: Los índices son estructuras de datos que se utilizan para acelerar la recuperación de registros en una base de datos. Crear índices en las columnas que se utilizan con frecuencia en las cláusulas `WHERE`, `JOIN` y `ORDER BY` puede mejorar significativamente el rendimiento de las consultas.
2. **Selección apropiada de columnas**: Evitar seleccionar columnas innecesarias en una consulta puede reducir la carga de trabajo del motor de base de datos y mejorar el rendimiento. Seleccionar solo las columnas que son necesarias para la consulta puede ayudar a minimizar el tiempo de ejecución y la cantidad de datos transferidos entre el servidor de base de datos y la aplicación.
3. **Uso de cláusulas WHERE y JOIN eficientes**: Utilizar cláusulas `WHERE` y `JOIN` de manera eficiente puede ayudar a reducir el número de filas que se deben procesar durante la ejecución de una consulta. Esto puede lograrse utilizando índices, escribiendo condiciones de filtro efectivas y evitando operaciones costosas como las búsquedas de texto completo.
4. **Uso de funciones agregadas de manera adecuada**: Al utilizar funciones agregadas como `SUM`, `COUNT`, `AVG`, etc., es importante considerar cómo se están agrupando y filtrando los datos. Asegurarse de que las funciones agregadas se utilicen de manera eficiente puede ayudar a minimizar el tiempo de ejecución de la consulta.
5. **Optimización de subconsultas** : Las subconsultas pueden ser útiles para estructurar consultas complejas, pero también pueden afectar el rendimiento si no se utilizan correctamente. Es importante asegurarse de que las subconsultas estén optimizadas adecuadamente para evitar problemas de rendimiento.
6. **Monitoreo del rendimiento y ajuste**: Una vez que se han implementado las optimizaciones de consulta, es importante monitorear el rendimiento de las consultas en la base de datos y realizar ajustes según sea necesario. Esto puede implicar revisar los planes de ejecución de consultas, identificar cuellos de botella de rendimiento y realizar ajustes en el esquema de la base de datos o en las consultas mismas para mejorar el rendimiento.

## Query plan

El plan de consulta (query plan en inglés) es una representación detallada de cómo el motor de base de datos ejecutará una consulta SQL específica. El plan de consulta describe la secuencia de pasos que el motor de base de datos seguirá para procesar la consulta y recuperar los resultados solicitados.

Cuando envías una consulta SQL al motor de base de datos, el motor no ejecuta la consulta de inmediato. En su lugar, primero analiza la consulta y genera un plan de consulta, que luego se utiliza para ejecutar la consulta de manera eficiente. El plan de consulta se genera utilizando el optimizador de consultas del motor de base de datos, que evalúa diferentes estrategias de ejecución y selecciona la más óptima en función de varios factores, como la estructura de la consulta, la distribución de datos y la disponibilidad de índices.

El plan de consulta puede variar según la implementación del motor de base de datos y las características específicas de la consulta. Sin embargo, algunos componentes comunes que suelen estar presentes en un plan de consulta incluyen:

1. **Escaneo de tabla**: Indica cómo se accederán a las tablas en la base de datos. Puede incluir escaneos completos de tablas, escaneos de índices o escaneos condicionales utilizando índices.
2. **Operaciones de filtro y ordenación**: Indica cómo se aplicarán los filtros y la ordenación a los datos recuperados. Esto puede incluir operaciones de filtro basadas en condiciones `WHERE` y operaciones de ordenación basadas en cláusulas `ORDER BY`.
3. **Operaciones de unión**: Si la consulta incluye operaciones de unión (por ejemplo, un `JOIN`), el plan de consulta indicará cómo se realizarán estas operaciones y qué tipo de unión se utilizará (por ejemplo, unión anidada, unión de bucle, unión de hash).
4. **Operaciones de agrupación y agregación**: Si la consulta incluye operaciones de agrupación y agregación (por ejemplo, `GROUP BY` y funciones de agregación como `SUM`, `COUNT`, etc.), el plan de consulta indicará cómo se realizarán estas operaciones y en qué orden.
5. **Plan de ejecución global**: El plan de consulta también puede incluir una descripción general de la estrategia de ejecución de la consulta en su conjunto, incluidas las etapas de procesamiento y cualquier operación adicional que se realice.

El plan de consulta es una herramienta importante para comprender cómo se ejecutará una consulta en la base de datos y puede ser útil para identificar cuellos de botella de rendimiento, optimizar consultas y diagnosticar problemas de rendimiento en la base de datos. Algunos sistemas de gestión de bases de datos permiten ver y analizar el plan de consulta generado para una consulta específica, lo que puede ayudar a los desarrolladores y administradores de bases de datos a optimizar el rendimiento de la base de datos.

Para ver el query plan de una consulta en MySQL añadiremos EXPLAIN ANALYZE antes de la consulta. Por ejemplo:



```sql
EXPLAIN ANALYZE
SELECT *
FROM actor a
INNER JOIN film_actor fa ON fa.actor_id=a.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
WHERE f.title='ACADEMY DINOSAUR'
```

El query plan aparece con el siguiente formato

```
-> Nested loop inner join  (cost=4.01 rows=5.48) (actual time=0.0275..0.0533 rows=10 loops=1)
    -> Nested loop inner join  (cost=2.09 rows=5.48) (actual time=0.0216..0.0285 rows=10 loops=1)
        -> Covering index lookup on f using idx_title (title='ACADEMY DINOSAUR')  (cost=0.725 rows=1) (actual time=0.0139..0.0147 rows=1 loops=1)
        -> Covering index lookup on fa using idx_fk_film_id (film_id=f.film_id)  (cost=1.36 rows=5.48) (actual time=0.00686..0.0122 rows=10 loops=1)
    -> Single-row index lookup on a using PRIMARY (actor_id=fa.actor_id)  (cost=0.268 rows=1) (actual time=0.00222..0.00224 rows=1 loops=10)

```

Para poder interpretar esta salida debemos conocer los siguientes campos:

1. **type**: Este es un indicador clave del rendimiento de la consulta. Describe cómo MySQL accederá a los datos y qué tipo de acceso se realizará. Los posibles valores incluyen "ALL" (escaneo completo de la tabla), "INDEX" (escaneo de índice), "RANGE" (búsqueda por rango), "REF" (búsqueda utilizando un índice), "FULLTEXT" (búsqueda de texto completo), entre otros.
2. **rows**: El número estimado de filas que MySQL tendrá que examinar para procesar la consulta. Cuantas menos filas tenga que examinar MySQL, más eficiente será la consulta.
3. **filtered**: El porcentaje estimado de filas que MySQL espera que coincidan con los criterios de filtro de la consulta.
4. **Loops (bucles)**:  se refieren a la forma en que MySQL accede a las tablas y cómo se relacionan entre sí en el plan de ejecución. Un loop se produce cuando MySQL necesita realizar múltiples búsquedas en una tabla para procesar una consulta. Por ejemplo, si estás realizando una unión (`JOIN`) entre dos tablas y MySQL necesita buscar en la tabla de la derecha para cada fila en la tabla de la izquierda, se crea un loop. Los loops pueden ser indicativos de consultas ineficientes y pueden afectar negativamente el rendimiento. Es importante revisar los loops en la salida de `EXPLAIN ANALYZE` para identificar posibles áreas de optimización en la consulta.
5. **Cost (costo)**: se refiere a una estimación del costo relativo de ejecutar una operación en el plan de ejecución de la consulta. El costo no es una medida directa de tiempo o recursos, sino más bien una medida relativa de la complejidad de la operación. MySQL utiliza el costo para seleccionar el plan de ejecución más eficiente para una consulta. En general, se prefiere un plan de ejecución con un costo más bajo, ya que esto suele indicar que la consulta se ejecutará de manera más eficiente. Sin embargo, el costo es solo una estimación y puede variar según diversos factores, por lo que no debe tomarse como una medida exacta del rendimiento de la consulta.

## Índices

Los índices en SQL son estructuras de datos que se utilizan para mejorar el rendimiento de las consultas al acelerar la recuperación de datos en una base de datos. Los índices actúan como un mecanismo de búsqueda que permite al motor de base de datos encontrar rápidamente los registros que coinciden con ciertos criterios de búsqueda.

Cuando se crea un índice en una tabla, se crea una estructura adicional que contiene una lista ordenada de los valores de una o más columnas específicas de esa tabla, junto con punteros a las filas correspondientes en la tabla principal. Esto permite que el motor de base de datos busque rápidamente los valores de las columnas indexadas y recupere las filas asociadas.

Aquí hay algunas características y consideraciones importantes sobre los índices en SQL:

1. **Mejora de rendimiento**: Los índices pueden mejorar significativamente el rendimiento de las consultas al reducir la cantidad de datos que el motor de base de datos necesita examinar para satisfacer una consulta. Esto es especialmente útil en tablas grandes o en consultas que involucran operaciones de búsqueda o filtrado.
2. **Selección de columnas indexadas**: Es importante seleccionar las columnas correctas para indexar. Las columnas que se utilizan con frecuencia en cláusulas `WHERE`, `JOIN` y `ORDER BY` son buenas candidatas para la indexación.
3. **Tipos de índices**: Los sistemas de gestión de bases de datos (DBMS) ofrecen diferentes tipos de índices, como índices simples, índices compuestos (que incluyen múltiples columnas) y índices únicos (que no permiten valores duplicados). Algunos DBMS también admiten índices especiales para tipos de datos específicos, como índices espaciales para datos geoespaciales.
4. **Impacto en la escritura**: Si bien los índices pueden mejorar el rendimiento de las consultas de lectura, pueden tener un impacto negativo en el rendimiento de las operaciones de escritura (como inserciones, actualizaciones y eliminaciones), ya que el DBMS necesita mantener los índices actualizados cada vez que se modifican los datos subyacentes.
5. **Costo de mantenimiento**: Los índices ocupan espacio de almacenamiento adicional en el disco y requieren tiempo y recursos para mantenerse. Es importante equilibrar los beneficios de rendimiento de los índices con el costo de almacenamiento y mantenimiento asociado.
6. **Estadísticas de índices**: Los DBMS suelen mantener estadísticas sobre los índices, como la distribución de valores en las columnas indexadas y la cardinalidad de los índices, para ayudar al optimizador de consultas a tomar decisiones informadas sobre el plan de ejecución de consultas.

En resumen, los índices en SQL son herramientas poderosas para mejorar el rendimiento de las consultas al acelerar la recuperación de datos. Sin embargo, es importante comprender cómo funcionan los índices y cuándo y cómo utilizarlos adecuadamente para obtener el máximo beneficio en términos de rendimiento de la base de datos.
