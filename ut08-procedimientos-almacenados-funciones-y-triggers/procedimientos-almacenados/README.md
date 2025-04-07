---
cover: ../../.gitbook/assets/plsql.jpg
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

# Procedimientos almacenados

Un procedimiento almacenado es una secuencia de instrucciones SQL que se almacenan en el servidor de la base de datos y pueden ser ejecutados en cualquier momento.

{% tabs %}
{% tab title="MySQL" %}
La sintaxis básica para la creación de procedimientos almacenados en MySQL es la siguiente

```plsql
CREATE
    PROCEDURE [IF NOT EXISTS] sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body

proc_parameter:
    [ IN | OUT | INOUT ] param_name type

characteristic: {
    COMMENT 'string'
  | LANGUAGE SQL  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }
}

routine_body:
    SQL routine
```
{% endtab %}

{% tab title="PostgreSQL" %}
La sintaxis básica para la creación de procedimientos almacenados en PostgreSQL es la siguiente

```plsql
CREATE [ OR REPLACE ] PROCEDURE
    name ( [ [ argmode ] [ argname ] argtype [ { DEFAULT | = } default_expr ] [, ...] ] )
  { LANGUAGE lang_name
    | TRANSFORM { FOR TYPE type_name } [, ... ]
    | [ EXTERNAL ] SECURITY INVOKER | [ EXTERNAL ] SECURITY DEFINER
    | SET configuration_parameter { TO value | = value | FROM CURRENT }
    | AS 'definition'
    | AS 'obj_file', 'link_symbol'
    | sql_body
  } ...
```
{% endtab %}
{% endtabs %}

## Parámetros

Los procedimientos almacenados pueden definir dos tipos de parámetros:

* De entrada (**IN**): cuando se invoca el procedimiento se debe proveer un valor para este parámetro, dicho valor se utilizará dentro del procedimiento.
* De salida (**OUT**): cuando se invoca el procedimiento no se pasa un valor, sino una referencia a una variable. Al finalizar la invocación, dicha variable contendrá un valor calculado durante la ejecución del procedimiento
* De entrada/salida (**INOUT**): es una mezcla de las dos anteriores. Cuando se invoca el procedimiento se debe pasar una variable con un valor asignado. Durante la ejecución del procedimiento, dicho valor puede cambiar y se verá reflejado en la variable.

Por ejemplo, si se desea crear un procedimiento almacenado que muestra las películas de una categoría dada:

{% tabs %}
{% tab title="MySQL" %}
En MySQL

```plsql
CREATE PROCEDURE list_films(
	IN category VARCHAR(25), 
	OUT category_films INT UNSIGNED
)
BEGIN
  SET category_films = (SELECT COUNT(fc.film_id)
	  FROM category c
	  LEFT JOIN film_category fc ON c.category_id = fc.category_id
	  WHERE c.name = category);
END;
```

Veamos en detalle:

* El parámetro de salida category\_films se carga con el SET
{% endtab %}

{% tab title="PostgreSQL" %}
En PostgreSQL, debido a que dentro de la definición de un proceso almacenado hay varias sentencias, es necesario modificar el delimitador de sentencia durante su definición en un script, para así poder distinguir entre el final de una sentencia dentro del procedimiento almacenado y el final de la declaración del procedimiento almacenado.

Normalmente el delimitador que se utiliza durante la declaración del procedimiento / función / trigger es `$$`

```plsql
CREATE OR REPLACE PROCEDURE sakila.list_films(
	IN category VARCHAR(25), 
	OUT category_films INT
)
LANGUAGE plpgsql
AS $$
BEGIN
  	SELECT COUNT(fc.film_id) INTO category_films
	  FROM category c
	  LEFT JOIN film_category fc ON c.category_id = fc.category_id
	  WHERE c.name = category ;
END;$$
```

Veamos en detalle:

* El parámetro de salida category\_films se carga en la query usando INTO
* Se debe cambiar el valor del delimiter  en la línea 6
{% endtab %}
{% endtabs %}

Este procedimiento:

* Se llama list\_films
* Tiene un parámetro de entrada llamado category
* Tiene un parámetro de salida llamado category\_films
* Cuando se invoca, calcula el número de películas de la categoría y guarda el resultado en el parámetro de salida category\_films

### Conflicto de nombres

Puede ocurrir que hayamos definido algún parámetro del procedimiento con el mismo nombre que una columna de alguna de las queries que se ejecutan dentro, en este caso tenemos un conflicto de nombre que se resuelve de la siguiente manera:

{% tabs %}
{% tab title="MySQL" %}
En MySQL se utiliza el nombre del parámetro tal cual y para las columnas se usa el prefijo de la tabla.

```plsql
CREATE PROCEDURE count_films(
	IN actor_id INT, 
	OUT actor_films INT UNSIGNED
)
BEGIN
  SET actor_films = (SELECT COUNT(fa.film_id)
	  FROM film_actor fa 
	  WHERE fa.actor_id = actor_id);
END;
```
{% endtab %}

{% tab title="PostgreSQL" %}
En PostgreSQL se utiliza el nombre del procedimiento como prefijo antes del parámetro para diferenciarlo de la columna de la tabla

```plsql
CREATE OR REPLACE PROCEDURE count_films(
	IN actor_id INT, 
	OUT actor_films INT
)
LANGUAGE plpgsql
AS $$
BEGIN
  	SELECT COUNT(fa.film_id) INTO actor_films
	FROM film_actor fa 
	WHERE fa.actor_id = count_films.actor_id;
END;$$
```

Veamos en detalle:

* El parámetro de salida category\_films se carga en la query usando INTO
* Se debe cambiar el valor del delimiter  en la línea 6
{% endtab %}
{% endtabs %}

<pre class="language-plsql"><code class="lang-plsql"><strong>-- Esta sentencia elimina el procedimiento si ya existía
</strong><strong>DROP PROCEDURE IF EXISTS list_films;
</strong><strong>-- Empieza la declaración
</strong>CREATE PROCEDURE list_films(
	IN category VARCHAR(50), 
	OUT category_films INT
)
BEGIN
  SET category_films = (SELECT COUNT(fc.film_id)
	  FROM category c
	  LEFT JOIN film_category fc ON c.category_id = fc.category_id
	  WHERE c.name = category);
END

</code></pre>

## Invocación de un procedimiento almacenado

Una vez definido un procedimiento, es posible invocarlo de la siguiente manera

{% tabs %}
{% tab title="MySQL" %}
En MySQL usamos la palabra reservada CALL. Los parámetros de salida deben tener un nombre que empieza por @, así MySQL sabe que se está declarando esa variable y que el procedimiento va a cargar valores dentro.

<pre class="language-sql"><code class="lang-sql">-- Se invoca el procedimiento list_films con el parámetro 'Horror'
<strong>CALL list_films('Horror', @category_films);
</strong><strong>SELECT @category_films;
</strong></code></pre>

Ten en cuenta que aquí volvemos a usar el delimitador `;`.Si se ejecuta esto justo después de la definición del procedimiento, será necesario cambiar el delimitador antes de la llamada.

<pre class="language-sql"><code class="lang-sql"><strong>DELIMITER ;
</strong><strong>-- Se invoca el procedimiento list_films con el parámetro 'Horror'
</strong><strong>CALL list_films('Horror', @category_films);
</strong>SELECT @category_films;
</code></pre>
{% endtab %}

{% tab title="PostgreSQL" %}
En PosgtreSQL usamos la palabra reservada CALL. Los parámetros de salida se debe pasar null y obtenemos el resultado en pantalla al ejecutar el CALL.

<pre class="language-sql"><code class="lang-sql"><strong>CALL list_films('Horror', null);
</strong></code></pre>
{% endtab %}
{% endtabs %}

## Casos de uso

### Transacciones complejas

Los procedimientos almacenados son útiles para coordinar y controlar transacciones complejas que involucran múltiples operaciones de base de datos. Esto garantiza la integridad de los datos y la consistencia de la base de datos, al tiempo que simplifica la lógica de la aplicación.

Al ejecutar múltiples instrucciones SQL dentro de un procedimiento almacenado, se reduce el tráfico de red entre la aplicación y el servidor de base de datos. Esto puede mejorar significativamente el rendimiento, especialmente para operaciones que involucran consultas complejas o procesamiento de datos intensivo.

### Ejecución programada

Los procedimientos almacenados pueden ser programados para ejecutarse en momentos específicos utilizando un programador de tareas del sistema operativo o un planificador de eventos del servidor de base de datos. Esto es útil para tareas de mantenimiento programadas, generación de informes, etc.
