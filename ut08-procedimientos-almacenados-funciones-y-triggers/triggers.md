---
cover: ../.gitbook/assets/plsql.jpg
coverY: 0
---

# Triggers

Los triggers (disparadores) son bloques de código PL/SQL que se ejecutan automáticamente en respuesta a ciertos eventos que ocurren en una tabla específica. Estos eventos pueden ser:

* Operaciones de inserción (INSERT)
* Operaciones de actualización (UPDATE)
* Operaciones de eliminación (DELETE)&#x20;

Los triggers se pueden utilizar para realizar diversas acciones, como mantener la integridad de los datos, auditar cambios, aplicar reglas de negocio específicas, entre otros fines.

Los triggers pueden ser configurados para activarse **antes del evento** (BEFORE) **o después del evento** (AFTER).

## Crear un trigger

```plsql
CREATE [ OR REPLACE ] [ CONSTRAINT ] TRIGGER name { BEFORE | AFTER | INSTEAD OF } { event [ OR ... ] }
    ON table_name
    [ FROM referenced_table_name ]
    [ NOT DEFERRABLE | [ DEFERRABLE ] [ INITIALLY IMMEDIATE | INITIALLY DEFERRED ] ]
    [ REFERENCING { { OLD | NEW } TABLE [ AS ] transition_relation_name } [ ... ] ]
    [ FOR [ EACH ] { ROW | STATEMENT } ]
    [ WHEN ( condition ) ]
    EXECUTE { FUNCTION | PROCEDURE } function_name ( arguments )

where event can be one of:

    INSERT
    UPDATE [ OF column_name [, ... ] ]
    DELETE
    TRUNCATE
```
