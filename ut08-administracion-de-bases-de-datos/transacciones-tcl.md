# Transacciones (TCL)

Una transacción es una secuencia de operaciones que se ejecutan como una unidad indivisible de trabajo. Estas operaciones pueden ser consultas SQL como INSERT, UPDATE, DELETE o cualquier otra operación que modifique los datos en la base de datos. El concepto fundamental detrás de las transacciones es que todas las operaciones dentro de una transacción deben completarse con éxito o ninguna de ellas debe aplicarse en absoluto. Esto se conoce como el principio ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad), que garantiza la integridad de los datos y la fiabilidad de las operaciones en la base de datos.

A continuación se detallan las principales características de las transacciones

### Atomicidad

La atomicidad garantiza que todas las operaciones dentro de una transacción se realicen como una unidad atómica. Esto significa que o bien todas las operaciones se completan con éxito y se guardan permanentemente en la base de datos, o ninguna de ellas se aplica en absoluto si algo falla. En otras palabras, si una parte de la transacción falla, la base de datos se restaura a su estado original antes de que comenzara la transacción.

### Consistencia

La consistencia asegura que la base de datos esté en un estado válido antes y después de una transacción. Esto significa que todas las restricciones de integridad y reglas de negocio se mantienen durante la ejecución de la transacción. Si una transacción viola alguna restricción de integridad, la transacción se revierte y la base de datos vuelve a su estado original.

### Aislamiento

El aislamiento controla cómo las transacciones concurrentes interactúan entre sí. Garantiza que el resultado de una transacción sea independiente de otras transacciones concurrentes. MySQL proporciona diferentes niveles de aislamiento (por ejemplo, READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ, SERIALIZABLE) que controlan el nivel de visibilidad de los cambios realizados por otras transacciones.

### Durabilidad

La durabilidad garantiza que los cambios realizados por una transacción se guarden permanentemente en la base de datos incluso en caso de fallo del sistema. Una vez que una transacción se ha confirmado (mediante un COMMIT), los cambios son permanentes y no se pueden deshacer, incluso en caso de fallo del sistema.

## Sintaxis

{% tabs %}
{% tab title="MySQL" %}


En MySQL, puedes comenzar una transacción con la instrucción `START TRANSACTION`, confirmarla con `COMMIT` o revertirla con `ROLLBACK`. Por defecto, las transacciones se confirman automáticamente a menos que se especifique lo contrario con `SET AUTOCOMMIT = 0`.

Ejemplo de uso de transacciones en MySQL:

```sql
START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 123;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 456;
COMMIT;
```
{% endtab %}

{% tab title="PostgreSQL" %}


En PostgreSQL, al igual que en MySQL, puedes comenzar una transacción con la instrucción `BEGIN`, confirmarla con `COMMIT` o revertirla con `ROLLBACK`. Por defecto, las transacciones se confirman automáticamente, pero puedes deshabilitar esta funcionalidad con la instrucción `SET AUTOCOMMIT = OFF`.

Ejemplo de uso de transacciones en PostgreSQL:

```sql
BEGIN;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 123;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 456;
COMMIT;
```
{% endtab %}
{% endtabs %}

En resumen, las transacciones en MySQL proporcionan un mecanismo para garantizar la integridad de los datos y la consistencia de las operaciones en la base de datos, lo que permite realizar operaciones complejas de manera segura y confiable.

### Commit



### Rollback



## Scripts



