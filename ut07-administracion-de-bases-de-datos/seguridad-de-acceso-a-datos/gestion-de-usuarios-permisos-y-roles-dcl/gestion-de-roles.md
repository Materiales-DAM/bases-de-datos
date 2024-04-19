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

# Gestión de roles

Los roles son entidades que agrupan conjuntos de permisos y privilegios. Permiten simplificar la administración de permisos al asignar roles específicos a usuarios en lugar de configurar permisos individuales para cada usuario. Esto simplifica la gestión de permisos, especialmente en sistemas con muchos usuarios y complejas estructuras de permisos.

La asignación de permisos a un rol se hace igual que a los usuarios.

## Creación de roles

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

## Eliminación de roles

Para eliminar un role, primero debemos revocar todos sus permisos. Una vez revocados los permisos, ya podemos eliminarlo.

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

## Asignar / revocar roles a usuarios

{% tabs %}
{% tab title="MySQL" %}
Para asignar un role a un usuario se utiliza el comando GRANT y después activar el role

<pre class="language-sql"><code class="lang-sql"><strong>GRANT '&#x3C;rol_name>' TO '&#x3C;username>';
</strong>set default &#x3C;rol_name> to '&#x3C;username>';
</code></pre>

Para quitar un rol a un usuario se utiliza el comando REVOKE

```sql
REVOKE '<rol_name>' TO '<username>';
```

Por ejemplo

```sql
# Añade el role employee al usuario mikel
GRANT 'employee' TO 'mikel';
set default 'employee' to 'mikel';
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
