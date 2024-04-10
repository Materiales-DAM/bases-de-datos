---
cover: ../../.gitbook/assets/stored_procedures.jpg
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

# Procedimientos almacenados

Un procedimiento almacenado es una secuencia de instrucciones SQL que se almacenan en el servidor de la base de datos y pueden ser ejecutados en cualquier momento.

## Definición de procedimientos almacenados

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

### Parámetros

Los procedimientos almacenados pueden definir dos tipos de parámetros:

* De entrada (**IN**): cuando se invoca el procedimiento se debe proveer un valor para este parámetro, dicho valor se utilizará dentro del procedimiento.
* De salida (**OUT**): cuando se invoca el procedimiento no se pasa un valor, sino una referencia a una variable. Al finalizar la invocación, dicha variable contendrá un valor calculado durante la ejecución del procedimiento
* De entrada/salida (**INOUT**): es una mezcla de las dos anteriores. Cuando se invoca el procedimiento se debe pasar una variable con un valor asignado. Durante la ejecución del procedimiento, dicho valor puede cambiar y se verá reflejado en la variable.

### Ejemplo

Si se desea crear un procedimiento almacenado que muestra las películas de una categoría dada:

```plsql
CREATE PROCEDURE list_films(
	IN category VARCHAR(50), 
	OUT category_films INT UNSIGNED
)
BEGIN
  SET category_films = (SELECT COUNT(fc.film_id)
	  FROM category c
	  LEFT JOIN film_category fc ON c.category_id = fc.category_id
	  WHERE c.name = category);
END;
```

Este procedimiento:

* Se llama list\_films
* Tiene un parámetro de entrada llamado category
* Tiene un parámetro de salida llamado category\_films
* Cuando se invoca, calcula el número de películas de la categoría y guarda el resultado en el parámetro de salida category\_films

### DELIMITER

Debido a que dentro de la definición de un proceso almacenado hay varias sentencias, es necesario modificar el delimitador de sentencia durante su definición en un script, para así poder distinguir entre el final de una sentencia dentro del procedimiento almacenado y el final de la declaración del procedimiento almacenado.

Normalmente el delimitador que se utiliza durante la declaración del procedimiento / función / trigger es `$$`

<pre class="language-plsql"><code class="lang-plsql"><strong>DELIMITER $$
</strong><strong>-- Esta sentencia elimina el procedimiento si ya existía
</strong><strong>DROP PROCEDURE IF EXISTS list_films $$
</strong><strong>-- Empieza la declaración
</strong>CREATE PROCEDURE list_films(
	IN category VARCHAR(50), 
	OUT category_films INT UNSIGNED
)
BEGIN
  SET category_films = (SELECT COUNT(fc.film_id)
	  FROM category c
	  LEFT JOIN film_category fc ON c.category_id = fc.category_id
	  WHERE c.name = category);
END
$$ -- Aquí indicamos que finaliza la definición del procedimiento
</code></pre>

## Invocación de un procedimiento almacenado

Una vez definido un procedimiento, es posible invocarlo utilizando la palabra reservada CALL

<pre class="language-sql"><code class="lang-sql"><strong>-- Se invoca el procedimiento list_films con el parámetro 'Horror'
</strong><strong>CALL list_films('Horror', @category_films);
</strong><strong>SELECT @category_films;
</strong></code></pre>

Ten en cuenta que aquí volvemos a usar el delimitador `;`.Si se ejecuta esto justo después de la definición del procedimiento, será necesario cambiar el delimitador antes de la llamada.

<pre class="language-sql"><code class="lang-sql"><strong>DELIMITER ;
</strong><strong>-- Se invoca el procedimiento list_films con el parámetro 'Horror'
</strong><strong>CALL list_films('Horror', @category_films);
</strong>SELECT @category_films;
</code></pre>

## Casos de uso

### Transacciones complejas

Los procedimientos almacenados son útiles para coordinar y controlar transacciones complejas que involucran múltiples operaciones de base de datos. Esto garantiza la integridad de los datos y la consistencia de la base de datos, al tiempo que simplifica la lógica de la aplicación.

Al ejecutar múltiples instrucciones SQL dentro de un procedimiento almacenado, se reduce el tráfico de red entre la aplicación y el servidor de base de datos. Esto puede mejorar significativamente el rendimiento, especialmente para operaciones que involucran consultas complejas o procesamiento de datos intensivo.

### Ejecución programada

Los procedimientos almacenados pueden ser programados para ejecutarse en momentos específicos utilizando un programador de tareas del sistema operativo o un planificador de eventos del servidor de base de datos. Esto es útil para tareas de mantenimiento programadas, generación de informes, etc.
