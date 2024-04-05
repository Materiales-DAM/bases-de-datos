# Scripts de creación

## World

Solo disponible para MySQL

{% file src="../.gitbook/assets/world-db.zip" %}

En el directorio donde se haya descargado el zip ejecutar lo siguiente

```bash
CONTAINER=diurno-mysql
PASSWORD=Sandia4you
unzip -o world-db.zip
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < world-db/world.sql
```

## Sakila

{% tabs %}
{% tab title="MySQL" %}
{% file src="../.gitbook/assets/sakila-db.zip" %}

En el directorio donde se haya descargado el zip ejecutar lo siguiente

```bash
CONTAINER=diurno-mysql
PASSWORD=Sandia4you
unzip -o sakila-db.zip
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < sakila-db/sakila-schema.sql
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < sakila-db/sakila-data.sql
```
{% endtab %}

{% tab title="PostgreSQL" %}
{% file src="../.gitbook/assets/postgres-sakila.zip" %}

Para instalar ejecutar los siguientes comandos en el directorio donde se ha descargado el fichero anterior

```bash
CONTAINER=diurno-postgres
unzip -o postgres-sakila.zip
docker exec -i $CONTAINER psql -U postgres < postgres-sakila-schema.sql
docker exec -i $CONTAINER psql -U postgres < postgres-sakila-insert-data.sql
```
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

