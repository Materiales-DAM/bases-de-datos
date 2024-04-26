---
cover: ../../.gitbook/assets/admin.jpg
coverY: 0
---

# Tareas de administración

## Instalación de clientes

```bash
sudo apt install mysql-client-8.0 postgresql-client -y
```

## Backups / Restore

Un backup, o copia de seguridad, es una copia duplicada de los datos almacenados en un sistema informático, como archivos, bases de datos, configuraciones del sistema, entre otros, que se realiza con el propósito de proteger esos datos contra pérdidas o daños. Los backups son esenciales para garantizar la disponibilidad y la integridad de los datos en caso de fallos de hardware, errores humanos, ataques de seguridad, desastres naturales u otros eventos que puedan provocar la pérdida de información.

{% tabs %}
{% tab title="MySQL" %}
En MySQL usaremos la utilidad mysqldump para realizar backups.&#x20;

```bash
mysqldump [-h host_mysql] -u tu_nombre_de_usuario -p nombre_de_tu_base_de_datos > archivo_de_backup.sql
```

Si deseas hacer una copia de seguridad de todas las bases de datos a la vez, usa:

```bash
mysqldump [-h host_mysql] -u tu_nombre_de_usuario -p --all-databases > todas_las_bases_de_datos_backup.sql
```
{% endtab %}

{% tab title="PostgreSQL" %}
En PostgreSQL usaremos la utilidad pg\_dump para realizar backups.&#x20;

```bash
pg_dump [-h host_postgres] -U nombre_de_usuario -d nombre_de_base_de_datos -f archivo_de_backup.sql
```
{% endtab %}
{% endtabs %}

## Restore

"Restore" (restauración en español) se refiere al proceso de recuperar datos desde una copia de seguridad (backup) y devolverlos a su estado original o a un estado funcional después de haberse perdido, dañado o corrompido.

Cuando se realiza una restauración, los datos almacenados en una copia de seguridad se transfieren de nuevo al sistema original o a otro sistema de destino para reemplazar los datos perdidos o dañados. Este proceso puede ser necesario debido a diversas razones, como errores humanos, fallos de hardware, ataques de seguridad, desastres naturales, entre otros.

{% tabs %}
{% tab title="MySQL" %}
En MySQL usaremos la utilidad cliente `mysql` para restaurar copias de seguridad.&#x20;

Primero creamos la base de datos y luego hacemos el restore

```bash
mysql [-h host_postgres] -u tu_nombre_de_usuario -p -e 'CREATE DATABASE nombre_de_tu_base_de_datos;'

mysql [-h host_postgres] -u tu_nombre_de_usuario -p nombre_de_tu_base_de_datos < archivo_de_backup.sql
```
{% endtab %}

{% tab title="PostgreSQL" %}
En PostgreSQL usaremos la utilidad cliente `psql` para restaurar copias de seguridad.&#x20;

Primero creamos la base de datos y luego hacemos el restore

```bash
createdb [-h host_postgres] -U nombre_de_usuario nombre_de_base_de_datos
psql [-h host_postgres] -U nombre_de_usuario -d nombre_de_base_de_datos -f archivo_de_backup.sql
```
{% endtab %}
{% endtabs %}

## Planificación de tareas

La planificación de tareas en bases de datos como PostgreSQL y MySQL es crucial para automatizar procesos recurrentes, como copias de seguridad, optimización de índices, limpieza de datos, entre otros.&#x20;

{% tabs %}
{% tab title="MySQL" %}
**Event Scheduler:** MySQL incluye un mecanismo integrado llamado Event Scheduler para programar y ejecutar tareas dentro del servidor MySQL. Puedes crear eventos que ejecuten sentencias SQL en momentos específicos o con intervalos regulares.

**Cron y scripts:** Al igual que en PostgreSQL, también puedes utilizar el programador de tareas del sistema operativo junto con scripts SQL para automatizar tareas en MySQL. Esto implica escribir un script SQL que contenga las acciones que deseas realizar y luego programar la ejecución de ese script en el programador de tareas del sistema operativo.
{% endtab %}

{% tab title="PostgreSQL" %}
**pgAgent:** PostgreSQL no incluye una utilidad de planificación de tareas incorporada, pero puedes utilizar herramientas de terceros como pgAgent, que es una herramienta de administración de tareas para PostgreSQL. pgAgent se instala como una extensión de PostgreSQL y te permite programar y ejecutar tareas SQL en momentos específicos.

**Cron y scripts:** Puedes utilizar el programador de tareas del sistema operativo (como cron en sistemas Unix/Linux o Programador de tareas en Windows) para ejecutar scripts SQL que contengan las tareas que deseas automatizar. Por ejemplo, puedes escribir un script SQL que realice una copia de seguridad de la base de datos y luego programar la ejecución de ese script en el programador de tareas del sistema operativo.
{% endtab %}
{% endtabs %}

### Acceso a base de datos en contenedor

Para acceder a la base de datos instalada en Docker el parámetro host se debe establecer a **172.17.0.1**
