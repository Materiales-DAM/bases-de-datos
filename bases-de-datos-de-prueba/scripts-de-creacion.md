# Scripts de creación

## World

Solo disponible para MySQL

{% file src="../.gitbook/assets/world-db.zip" %}

En el directorio donde se haya descargado el zip ejecutar lo siguiente

{% tabs %}
{% tab title="Ubuntu" %}
```bash
CONTAINER=diurno-mysql
PASSWORD=Sandia4you
unzip -o world-db.zip
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < world-db/world.sql
```
{% endtab %}

{% tab title="Windows" %}
Primero descomprime el archivo world-db.zip y abre la terminal CMD en el directorio donde esta el zip

```bash
docker exec -i diurno-mysql mysql -u root -pSandia4you < world-db/world.sql
```
{% endtab %}
{% endtabs %}

## Sakila

{% tabs %}
{% tab title="MySQL" %}
{% file src="../.gitbook/assets/sakila-db.zip" %}

En el directorio donde se haya descargado el zip ejecutar lo siguiente

{% tabs %}
{% tab title="Ubuntu" %}
```bash
CONTAINER=diurno-mysql
PASSWORD=Sandia4you
unzip -o sakila-db.zip
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < sakila-db/sakila-schema.sql
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < sakila-db/sakila-data.sql
```
{% endtab %}

{% tab title="Windows" %}
Primero descomprime el archivo sakila-db.zip y abre la terminal CMD en el directorio donde esta el zip

```bash
docker exec -i diurno-mysql mysql -u root -pSandia4you < sakila-db/sakila-schema.sql
docker exec -i diurno-mysql mysql -u root -pSandia4you < sakila-db/sakila-data.sql
```
{% endtab %}
{% endtabs %}
{% endtab %}

{% tab title="PostgreSQL" %}
{% file src="../.gitbook/assets/postgres-sakila.zip" %}

En el directorio donde se haya descargado el zip ejecutar lo siguiente

{% tabs %}
{% tab title="Ubuntu" %}
```bash
CONTAINER=diurno-postgres
unzip -o postgres-sakila.zip
docker exec -i $CONTAINER psql -U postgres < postgres-sakila-schema.sql
docker exec -i $CONTAINER psql -U postgres < postgres-sakila-insert-data.sql
```
{% endtab %}

{% tab title="Windows" %}
Primero descomprime el archivo sakila-db.zip y abre la terminal CMD en el directorio donde esta el zip

```bash
docker exec -i diurno-mysql psql -U postgres < postgres-sakila-schema.sql
docker exec -i diurno-mysql psql -U postgres < postgres-sakila-insert-dat
```
{% endtab %}
{% endtabs %}
{% endtab %}
{% endtabs %}

## Universidad

<figure><img src="../.gitbook/assets/image (144).png" alt=""><figcaption></figcaption></figure>

{% tabs %}
{% tab title="MySQL" %}
{% file src="../.gitbook/assets/universidad.sql" %}

Descarga el fichero anterior y desde la carpeta donde esté ejecuta

```bash
CONTAINER=diurno-mysql
PASSWORD=Sandia4you
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < universidad.sql
```
{% endtab %}

{% tab title="PostgreSQL" %}
{% file src="../.gitbook/assets/universidad-postgres (1).sql" %}

Descarga el fichero anterior y desde la carpeta donde esté ejecuta

```bash
CONTAINER=diurno-postgres
docker exec -i $CONTAINER psql -U postgres < universidad-postgres.sql
```
{% endtab %}
{% endtabs %}

