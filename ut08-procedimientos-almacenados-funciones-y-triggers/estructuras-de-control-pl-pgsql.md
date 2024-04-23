---
cover: ../.gitbook/assets/plsql.jpg
coverY: 0
---

# Estructuras de control PL/pgSQL

Una función es un objeto que encapsula una serie de instrucciones SQL para realizar una tarea específica y **devuelve un único valor**. Las funciones pueden ser definidas por el usuario o pueden ser funciones integradas proporcionadas por el sistema gestor de bases de datos. Las funciones pueden realizar cálculos, manipular datos y realizar diversas operaciones dentro de la base de datos...

## Creación de funciones

La sintaxis básica para la creación de funciones en MySQL es la siguiente

<pre class="language-plsql"><code class="lang-plsql"><strong>CREATE
</strong>    FUNCTION [IF NOT EXISTS] sp_name ([func_parameter[,...]])
    RETURNS type
    [characteristic ...] routine_body

characteristic: {
    COMMENT 'string'
  | LANGUAGE SQL  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }
}

routine_body:
    SQL routine
</code></pre>

Las funciones se pueden invocar dentro de sentencias SQL de varios tipos:

* Sentencias DML:&#x20;
  * INSERT
  * UPDATE
  * DELETE
* Sentencias DCL: todo tipo de consultas

### Parámetros

Todos los parámetros de las fuciones son de entrada, por lo que no se debe especificar.
