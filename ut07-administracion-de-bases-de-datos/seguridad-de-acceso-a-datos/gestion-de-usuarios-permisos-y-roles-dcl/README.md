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
