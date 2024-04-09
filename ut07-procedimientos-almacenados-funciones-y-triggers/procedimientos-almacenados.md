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

##

## Casos de uso

### Transacciones complejas

Los procedimientos almacenados son útiles para coordinar y controlar transacciones complejas que involucran múltiples operaciones de base de datos. Esto garantiza la integridad de los datos y la consistencia de la base de datos, al tiempo que simplifica la lógica de la aplicación.

Al ejecutar múltiples instrucciones SQL dentro de un procedimiento almacenado, se reduce el tráfico de red entre la aplicación y el servidor de base de datos. Esto puede mejorar significativamente el rendimiento, especialmente para operaciones que involucran consultas complejas o procesamiento de datos intensivo.

### Ejecución programada

Los procedimientos almacenados pueden ser programados para ejecutarse en momentos específicos utilizando un programador de tareas del sistema operativo o un planificador de eventos del servidor de base de datos. Esto es útil para tareas de mantenimiento programadas, generación de informes, etc.
