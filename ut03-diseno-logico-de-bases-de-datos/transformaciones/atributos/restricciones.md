---
cover: ../../../.gitbook/assets/relational.png
coverY: 96
---

# Restricciones

Es posible establecer restricciones a nivel de los atributos:

* **Restricciones de clave primaria**: Es el conjunto de atributos que identiıcan de forma única a una entidadç
*   **UNIQUE**: Es una restricción que impide que un atributo tenga un valor repetido. Todos los atributos clave cumplen esta restricción. No obstante es posible que algún atributo no sea

    clave y requiere una restricción de valor único.&#x20;
* **Restricciones de integridad referencial (FK)**: Se da cuando una tabla tiene una referencia a algún valor de otra tabla. En este caso la restricción exige que exista el valor referenciado en 1a otra tabla.
* **Restricciones de dominio**: Esta restricción restringe el conjunto de valores que puede tomar un campo. Por ejemplo, si se establece que un campo DNI pertenece al dominio de los números de 9 dígitos + 1 letra, no es posible insertar un DNI sin letra, puesto que la restricción obliga a poner al menos 1 letra.
* **Restricción de valor NULO (NULL)**: Un atributo puede ser obligatorio si no admite el valor NULO o NULL, es decir, el valor falta de información o desconocimiento. Si admite como valor el valor NULL, el atributo es opcional.&#x20;

Adicionalmente, existen mecanismos avanzados para realizar restriccione semánticas:

* **Restricciones de verificación (CHECK)**: Esta restricción permite comprobar si un valor de un atributo es válido conforme a una expresión
* Disparadores o **triggers**: Son procedimientos que se ejecutan para hacer una tarea concreta en el momento de insertar, modificar o eliminar información de una tabla.
* Restricciones genéricas adicionales o **aserciones** (ASSERT). Permite validar cualquiera de los atributos de una o varias tablas.
