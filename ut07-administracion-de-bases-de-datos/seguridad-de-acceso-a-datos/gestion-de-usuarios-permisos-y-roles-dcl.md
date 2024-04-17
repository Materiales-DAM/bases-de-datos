---
cover: ../../.gitbook/assets/cybersecurity.png
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

# Gestión de usuarios, permisos y roles (DCL)

Data Control Language (DCL) es el sublenguaje de SQL que provee los comandos utilizados para controlar los permisos de acceso a los datos en un sistema de gestión de bases de datos (DBMS). Los comandos DCL se utilizan para otorgar o revocar privilegios de acceso a los usuarios y para controlar otros aspectos de la seguridad de la base de datos.

## Usuarios

### Creación

{% tabs %}
{% tab title="MySQL" %}
Una vez que hayas iniciado sesión en MySQL, puedes usar el comando `CREATE USER` para crear un nuevo usuario. Aquí está la sintaxis básica:

```sql
CREATE USER '<username>'@'<host>' IDENTIFIED BY '<password>';
```

* **username**: Es el nombre del nuevo usuario que deseas crear.
* **host**: Es el host desde el que el usuario puede conectarse. En este campo se puede poner una dirección ip, un nombre de host (incluido localhost) o el símbolo **`%`** que indica que se permite conectar desde cualquier ip /  host.
* **password**: Es la contraseña que deseas asignar al nuevo usuario.

Por ejemplo, si queremos crear un usuario mi\_usuario, que tenga acceso desde cualquier máquina y cuyo password sea Sandia4you:

```sql
CREATE USER 'mi_usuario'@'%' IDENTIFIED BY 'Sandia4you';
```
{% endtab %}

{% tab title="PostgreSQL" %}
Una vez que hayas iniciado sesión en PostgreSQL, puedes usar el comando `CREATE USER` para crear un nuevo usuario. Aquí está la sintaxis básica:

```sql
CREATE USER <username> WITH PASSWORD '<password>';
```

* **username**: Es el nombre del nuevo usuario que deseas crear.
* **password**: Es la contraseña que deseas asignar al nuevo usuario.

Por ejemplo, si queremos crear un usuario mi\_usuario, cuyo password sea Sandia4you:

```sql
CREATE USER mi_usuario WITH PASSWORD 'Sandia4you';
```
{% endtab %}
{% endtabs %}

### Eliminación

{% tabs %}
{% tab title="MySQL" %}
Una vez que hayas iniciado sesión en MySQL, puedes usar el comando `DROP USER` para eliminar un usuario. Aquí está la sintaxis básica:

```sql
DROP USER '<username>';
```

* **username**: Es el nombre del nuevo usuario que deseas crear.

Por ejemplo, si queremos eliminar al usuario usuario mi\_usuario:

```sql
DROP USER 'mi_usuario';
```
{% endtab %}

{% tab title="PostgreSQL" %}
Una vez que hayas iniciado sesión en PostgreSQL, puedes usar el comando `DROP USER` para eliminar un usuario. Aquí está la sintaxis básica:

```sql
DROP USER <username>;
```

* **username**: Es el nombre del nuevo usuario que deseas crear.
* **password**: Es la contraseña que deseas asignar al nuevo usuario.

Por ejemplo, si queremos eliminar al usuario mi\_usuario,:

```sql
DROP USER mi_usuario;
```
{% endtab %}
{% endtabs %}

### Cambiar contraseña

{% tabs %}
{% tab title="MySQL" %}
Una vez que hayas iniciado sesión en MySQL, puedes usar el comando `ALTER USER` para modificar el usuario. Aquí está la sintaxis básica:

```sql
ALTER USER '<username>' IDENTIFIED BY '<password>';
```

* **username**: Es el nombre del nuevo usuario.
* **password**: Es la nueva contraseña que deseas asignar al usuario.

Por ejemplo, si queremos cambiar la contraseña del usuario mi\_usuario cambiando el password a Tokio2324:

```sql
ALTER USER 'mi_usuario' IDENTIFIED BY 'Tokio2324';
```
{% endtab %}

{% tab title="PostgreSQL" %}
Una vez que hayas iniciado sesión en PostgreSQL, puedes usar el comando `ALTER USER` para cambiar la contraseña de un usuario. Auí está la sintaxis básica:

```sql
ALTER USER <username> WITH PASSWORD '<password>';
```

* **username**: Es el nombre del usuario.
* **password**: Es la nueva contraseña que deseas asignar al nuevo usuario.

Por ejemplo, si queremos crear un usuario mi\_usuario, cuyo password sea Tokio2324:

```sql
ALTER USER mi_usuario WITH PASSWORD 'Tokio2324';
```
{% endtab %}
{% endtabs %}

## Gestión de permisos

La gestión de permisos se lleva a cabo a través de los comandos `GRANT` y `REVOKE`. Antes de estudiar dichos comandos hay que explicar los conceptos básicos de los permisos:

### Privilegios

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

### Objecto

Identifica el objeto sobre el que se están otorgando o revocando los privilegios. Puede ser una base de datos, una tabla, una columna o un conjunto de ellos.

{% tabs %}
{% tab title="MySQL" %}
Es posible seleccionar todas las tablas de una base de datos usando el comodín \*

`sakila.*`
{% endtab %}

{% tab title="PostgreSQL" %}
Es posible seleccionar todas las tablas de una base de datos usando la palabra reservada DATABASE&#x20;

<pre class="language-sql"><code class="lang-sql"><strong>DATABASE sakila
</strong></code></pre>
{% endtab %}
{% endtabs %}

### Usuario o rol

Especifica a qué usuario o rol se están otorgando o revocando los privilegios.

### GRANT

El comando GRANT se utiliza para otorgar privilegios a un usuario en una base de datos, tabla o columna específica. La sintaxis básica del comando GRANT es la siguiente:

```sql
GRANT privilegio1. privilegio2 ON base_de_datos.tabla1 TO <usuario>;
```

Por ejemplo, si quisiera permitir al usuario employee que pueda leer los datos de todas las tablas de Sakila ejecutaría

{% tabs %}
{% tab title="MySQL" %}
```sql
GRANT SELECT ON sakila.* TO 'employee';
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
GRANT SELECT ON DATABASE sakila TO employee;
```
{% endtab %}
{% endtabs %}

### REVOKE

El comando REVOKE se utiliza para revocar los privilegios previamente otorgados a un usuario en una base de datos, tabla o columna específica. La sintaxis básica del comando REVOKE es la siguiente:

```sql
REVOKE privilegios ON base_de_datos.tabla FROM <usuario>;
```

Por ejemplo, si quisiera revocar los privilegios al usuario employee de forma que no pueda leer los datos de ninguna las tablas de Sakila ejecutaría

{% tabs %}
{% tab title="MySQL" %}
```sql
REVOKE SELECT ON sakila.* FROM 'employee';
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
REVOKE SELECT ON DATABASE sakila FROM employee;
```
{% endtab %}
{% endtabs %}

### FLUSH (MySQL)

Después de otorgar o revocar privilegios, es necesario recargarlos para que tengan efecto usando el comando FLUSH

```sql
FLUSH PRIVILEGES;
```

## Roles

Los roles son entidades que agrupan conjuntos de permisos y privilegios. Permiten simplificar la administración de permisos al asignar roles específicos a usuarios en lugar de configurar permisos individuales para cada usuario. Esto simplifica la gestión de permisos, especialmente en sistemas con muchos usuarios y complejas estructuras de permisos.

La asignación de permisos a un rol se hace igual que a los usuarios.

### Creación de roles

{% tabs %}
{% tab title="MySQL" %}
```sql
CREATE ROLE '<rolename>'@'<host>';
```

Por ejemplo, si quiero crear un role llamado employee

```sql
CREATE ROLE 'employee'@'%';
```
{% endtab %}

{% tab title="PostgreSQL" %}
<pre class="language-sql"><code class="lang-sql"><strong>CREATE ROLE &#x3C;rolename>;
</strong></code></pre>

Por ejemplo, si quiero crear un role llamado employee

```sql
CREATE ROLE employee;
```
{% endtab %}
{% endtabs %}

### Eliminación de roles

{% tabs %}
{% tab title="MySQL" %}
```sql
DROP ROLE '<rolename>';
```

Por ejemplo, si quiero eliminar un role llamado employee

```sql
DROP ROLE 'employee';
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
DROP ROLE <rolename>;
```

Por ejemplo, si quiero eliminar un role llamado employee

```sql
DROP ROLE employee;
```
{% endtab %}
{% endtabs %}

### Asignar / desasignar roles a usuarios

{% tabs %}
{% tab title="MySQL" %}
Para asignar un role a un usuario se utiliza el comando GRANT de la siguiente manera

<pre class="language-sql"><code class="lang-sql"><strong>GRANT '&#x3C;rol_name>' TO '&#x3C;username>';
</strong></code></pre>

Para quitar un rol a un usuario se utiliza el comando REVOKE

```sql
REVOKE '<rol_name>' TO '<username>';
```

Por ejemplo

```sql
# Añade el role employee al usuario mikel
GRANT 'employee' TO 'mikel';
# Quita el role employee del usuario mikel
REVOKE 'employee' TO 'mikel';
```
{% endtab %}

{% tab title="PostgreSQL" %}
Para asignar un role a un usuario se utiliza el comando GRANT de la siguiente manera

<pre class="language-sql"><code class="lang-sql"><strong>GRANT &#x3C;rol_name> TO &#x3C;username>;
</strong></code></pre>

Para quitar un rol a un usuario se utiliza el comando REVOKE

```sql
REVOKE <rol_name> TO <username>;
```

Por ejemplo

```sql
# Añade el role employee al usuario mikel
GRANT employee TO mikel;
# Quita el role employee del usuario mikel
REVOKE employee TO mikel;
```
{% endtab %}
{% endtabs %}
