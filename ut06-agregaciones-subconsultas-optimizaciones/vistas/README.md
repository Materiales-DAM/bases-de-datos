---
cover: ../../.gitbook/assets/view-in-sql-server.png
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

# Vistas

Las vistas son consultas almacenadas que se comportan como tablas virtuales. Estas consultas no almacenan datos físicos por sí mismas, sino que representan los datos que se encuentran en una o más tablas. Las vistas permiten simplificar consultas complejas, restringir el acceso a datos sensibles y proporcionar una capa de abstracción sobre la estructura de la base de datos.

Algunas características importantes sobre las vistas:

1. **Abstracción de datos**: Las vistas permiten ocultar la complejidad de las consultas y la estructura de la base de datos. En lugar de interactuar directamente con las tablas subyacentes, los usuarios pueden consultar la vista como si fuera una tabla real.
2. **Seguridad**: Las vistas pueden utilizarse para restringir el acceso a ciertas columnas o filas de datos. Los usuarios pueden tener acceso solo a las columnas y filas específicas definidas en la vista, en lugar de acceder directamente a las tablas subyacentes.
3. **Optimización de consultas**: MySQL puede optimizar consultas utilizando vistas. Si una consulta se basa en una vista que ya ha sido calculada y almacenada en caché, MySQL puede ejecutar la consulta más eficientemente utilizando la definición de la vista en lugar de volver a calcular los resultados desde cero.
4. **Actualización**: En versiones recientes de MySQL, es posible definir vistas actualizables. Esto significa que puedes realizar operaciones de inserción, actualización y eliminación a través de la vista y que los cambios se reflejarán en las tablas subyacentes.
5. **Vistas materializadas (materialized views)**: Aunque no son nativas en MySQL, las vistas materializadas son un tipo de vista que almacena físicamente los resultados de una consulta. Esto puede mejorar el rendimiento de las consultas que acceden a datos complejos y cambiantes con poca frecuencia.

Para crear una vista en MySQL, puedes utilizar la siguiente sintaxis:

```sql
CREATE VIEW nombre_vista AS
SELECT columnas
FROM tablas
WHERE condiciones;
```

Una vez creada la vista, podemos consultarla como si fuera una tabla normal:

```sql
SELECT * FROM nombre_vista;

```
