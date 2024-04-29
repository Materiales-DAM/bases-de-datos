---
cover: ../.gitbook/assets/plsql.jpg
coverY: 0
---

# Estructuras de control PL/pgSQL

En PL/pgSQL, las estructuras de control son fundamentales para dirigir el flujo de ejecución de un programa. Aquí tienes una explicación de las principales:

## **IF-THEN-ELSE**

Esta estructura permite ejecutar cierto bloque de código si una condición es verdadera, y otro bloque si la condición es falsa.

```sql
IF condition THEN
    -- Bloque de código si la condición es verdadera
ELSE
    -- Bloque de código si la condición es falsa
END IF;
```

## **LOOP**

Permite ejecutar un bloque de código repetidamente hasta que una condición especificada sea verdadera.

```sql
LOOP
    -- Bloque de código
    EXIT WHEN condition;
END LOOP;
```

## **WHILE**

Similar al bucle LOOP, pero ejecuta un bloque de código mientras una condición sea verdadera.

```sql
WHILE condition LOOP
    -- Bloque de código
END LOOP;
```

## **FOR LOOP**

Itera sobre una secuencia de valores y ejecuta un bloque de código para cada valor en la secuencia.

```sql
FOR variable IN [REVERSE] valor_inicio..valor_fin LOOP
    -- Bloque de código
END LOOP;
```

## **CASE**

Permite realizar diferentes acciones basadas en el valor de una expresión.

```sql
CASE expression
    WHEN value1 THEN
        -- Acciones si expression es igual a value1
    WHEN value2 THEN
        -- Acciones si expression es igual a value2
    ELSE
        -- Acciones por defecto si ninguna condición se cumple
END CASE;
```

