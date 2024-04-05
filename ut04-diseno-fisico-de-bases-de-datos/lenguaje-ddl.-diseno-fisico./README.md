---
cover: ../../.gitbook/assets/mysqlpost.jpeg
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

# Lenguaje DDL. Diseño físico.

Para esta fase del diseño de bases de datos vamos a usar el lenguaje DDL que nos permite definir la estructura de las tablas de nuestra base de datos. Además, nos permite establecer relaciones entre ellas a través de las claves foráneas (foreign keys). También nos posibilita la creación de restricciones en las tablas.

Cada tabla se va a definir por:

* Un nombre único dentro de la base de datos
* Un conjunto de columnas, cada una de un tipo. Dentro de una tabla no puede haber dos columnas con el mismo nombre
* Un conjunto de restricciones que aplican a las columnas de la tabla.

La convención que vamos a seguir para el nombrado de las tablas y columnas es:

* Los nombres de las tablas y columnas son en **SINGULAR**
* Tanto los nombres de las tablas como los nombres de columnas serán en **Upper Camel Case**. Por ejemplo: PedidoCliente
*   Las palabras reservadas del lenguaje SQL se escriben en mayúsculas. `CREATE TABLE`\


    <figure><img src="../../.gitbook/assets/image (130).png" alt=""><figcaption></figcaption></figure>
* Los nombres de las restricciones irán precedidos de un prefijo que identifique el tipo de restricción. Por ejemplo: fk\_ClientePedido
