---
cover: ../../../.gitbook/assets/relational.png
coverY: 96
---

# Atributos

Los atributos de una entidad se transforma en un atributo (columna) de la tabla en la cual se ha transformado la entidad (a excepción de los derivados y multivaluados).  si el atributo estaba definido sobre un dominio, en el modelo relacional queda también definido sobre el mismo dominio.

* **Identificador principal**: Se transforma en la clave primaria de la tabla.
* **Identificadores alternativos**: Se transforman en claves alternativas en el modelo relacional.
* **Atributos obligatorios**: Se transforman en una columna de la tabla en la cual se ha transformado la entidad, no admitiendo valores nulos.
* **Atributos opcionales**: Se transforman en una columna de la tabla en la cual se ha transformado la entidad,  admitiendo valores nulos.
* **Atributos multivaluados**: Se crea una nueva tabla formada con la clave primaria de la entidad y el atributo multivaluado, siendo ambos clave primaria de la nueva tabla .
* **Atributos compuestos**: Se transforma en los atributos simples (campos) que componen el atributo compuesto, desapareciendo este como tal de la tabla
* **Atributos derivados**: No formarán parte del modelo relacional resultante, quedando eliminados en esta parte del diseño.

## Dominios



<table><thead><tr><th width="156">Nombre</th><th width="252">Descripción</th><th>Ejemplo</th></tr></thead><tbody><tr><td>VARCHAR</td><td>Cadena de caracteres</td><td>name VARCHAR(20)</td></tr><tr><td>INT</td><td>Número entero</td><td>age INT</td></tr><tr><td>BOOL</td><td>Booleano</td><td>manager BOOL</td></tr><tr><td>CHAR</td><td>Un solo caracter</td><td>group CHAR</td></tr><tr><td>DECIMAL</td><td>Número con decimales</td><td>price DECIMAL</td></tr><tr><td>DATE</td><td>Fecha</td><td>date DATE</td></tr><tr><td>DATETIME</td><td>Fecha y hora</td><td>datetime DATETIME</td></tr></tbody></table>
