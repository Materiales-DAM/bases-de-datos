---
cover: ../../../.gitbook/assets/cybersecurity.png
coverY: 0
layout:
  cover:
    visible: true
    size: full
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

# Gestión de permisos

La gestión de permisos se lleva a cabo a través de los comandos `GRANT` y `REVOKE`. Antes de estudiar dichos comandos hay que explicar los conceptos básicos de los permisos:

## Privilegios

Los privilegios son permisos que se otorgan a los usuarios para realizar operaciones específicas en las bases de datos, tablas o incluso columnas individuales. Los privilegios que se pueden otorgar o revocar a los usuarios son :

1. **SELECT**: Permite al usuario seleccionar datos de una tabla o vista. Este privilegio permite leer datos, pero no modificarlos.
2. **INSERT**: Permite al usuario insertar nuevos registros en una tabla.
3. **UPDATE**: Permite al usuario modificar registros existentes en una tabla.
4. **DELETE**: Permite al usuario eliminar registros de una tabla.
5. **CREATE**: Permite al usuario crear nuevas tablas, vistas, índices u otros objetos en una base de datos.
6. **DROP**: Permite al usuario eliminar tablas, vistas, índices u otros objetos de una base de datos.
7. **ALTER**: Permite al usuario modificar la estructura de una tabla existente, como agregar, eliminar o modificar columnas.
8. **GRANT OPTION**: Permite al usuario otorgar o revocar los privilegios que él mismo posee a otros usuarios.
9. **REFERENCES**: Permite al usuario crear una clave externa que haga referencia a una tabla en otra base de datos.
10. **INDEX**: Permite al usuario crear índices en una tabla.
11. **ALL PRIVILEGES**: Concede todos los privilegios disponibles en una base de datos o tabla.

## Objeto

Identifica el objeto sobre el que se están otorgando o revocando los privilegios. Puede ser una base de datos, una tabla, una columna o un conjunto de ellos.

{% tabs %}
{% tab title="MySQL" %}
Es posible seleccionar todas las tablas de una base de datos usando el comodín \*

```sql
sakila.*
```
{% endtab %}

{% tab title="PostgreSQL" %}
Es posible seleccionar todas las tablas de un schema usando la palabra reservada DATABASE&#x20;

```sql
ON ALL TABLES IN SCHEMA sakila
```
{% endtab %}
{% endtabs %}

## Usuario o rol

Especifica a qué usuario o rol se están otorgando o revocando los privilegios.

## GRANT

El comando GRANT se utiliza para otorgar privilegios a un usuario en una base de datos, tabla o columna específica. La sintaxis básica del comando GRANT es la siguiente:

```sql
GRANT privilegio1, privilegio2 ON base_de_datos.tabla1 TO <usuario>;
```

Por ejemplo, si quisiera permitir al usuario employee que pueda leer los datos de la tabla actor de sakila, ejecutaría

{% tabs %}
{% tab title="MySQL" %}
```sql
GRANT SELECT ON sakila.actor TO 'employee';
```
{% endtab %}

{% tab title="PostgreSQL" %}
En PostgreSQL, además de los permisos específicos que se dan sobre las tablas de los esquemas, es necesario dar un permiso especial de uso sobre el schema. Sin este permiso, el usuario no podrá acceder a las tablas del esquema, aunque tenga permisos sobre ellas.

```sql
-- Damos permiso para usar sakila
GRANT USAGE ON SCHEMA sakila TO employee;

-- Damos permiso para leer todas las tablas de sakila
GRANT SELECT ON ALL TABLES IN SCHEMA sakila TO employee;
```
{% endtab %}
{% endtabs %}

Si queremos dar permisos en todas las tablas de una base de datos

{% tabs %}
{% tab title="MySQL" %}
```sql
GRANT SELECT ON sakila.* TO 'employee';
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
GRANT SELECT ON ALL TABLES IN SCHEMA sakila TO employee;
```
{% endtab %}
{% endtabs %}

## REVOKE

El comando REVOKE se utiliza para revocar los privilegios previamente otorgados a un usuario en una base de datos, tabla o columna específica. La sintaxis básica del comando REVOKE es la siguiente:

```sql
REVOKE privilegios ON base_de_datos.tabla FROM <usuario>;
```

Por ejemplo, si quisiera revocar los privilegios al usuario employee de forma que no pueda leer los datos de ninguna las tablas de Sakila ejecutaría

{% tabs %}
{% tab title="MySQL" %}
```sql
REVOKE SELECT ON sakila.actor FROM 'employee';
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
REVOKE SELECT ON sakila.actor FROM employee;
```
{% endtab %}
{% endtabs %}

### FLUSH (MySQL)

Después de otorgar o revocar privilegios, es necesario recargarlos para que tengan efecto usando el comando FLUSH

```sql
FLUSH PRIVILEGES;
```
