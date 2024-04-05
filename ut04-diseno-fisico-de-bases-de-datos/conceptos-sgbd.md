---
cover: ../.gitbook/assets/mysqlpost.jpeg
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

# Conceptos SGBD

## Sistema Gestor de Bases de Datos (servidor de bases de datos)

Es el programa que alberga las bases de datos, otros programas se conectan a él para consultar, modificar o eliminar datos de la base de datos.

Estos programas se instalan como servicios en el sistema operativo y se quedan esperando a que se abran conexiones a sus bases de datos. Cada gestor de bases de datos abre un puerto virtual al que se pueden realizar las conexiones.

Los puertos por defecto de los principales SGBD son:

* MySQL: **3306**
* MariaDB: 3306
* Postgresql: **5432**
* Microsoft SQL Server: 1433
* Oracle: 1521

## Cliente de base de datos

Un programa cliente nos posibilita conectarnos a una base de datos desde nuestro equipo para realizar tareas de administración, consulta, desarrollo... sobre un SGBD.

Algunos de los clientes más populares son:

* **MySQL Workbench**: solo para MySQL
* PhpMyAdmin
* **DBeaver**
* pgAdmin

## Usuarios&#x20;

Los datos de un sistema son información sensible, incluso en muchas organizaciones son lo más valioso que tienen. Por esto, es necesario que el acceso a estos datos esté controlado por un sistema de autenticación y autorización que permita definir que pueden hacer y qué no los distintos tipos de usuario que tenga nuestro sistema.

## Base de datos

Dentro de un SGDB puede haber varias bases de datos. Cada base de datos contiene un conjunto de tablas, vistas, funciones, procedimientos almacenados... de un ámbito diferente.

## Structured Query Language (SQL)

SQL es el lenguaje más usado en entornos de gestores de bases de datos para la comunicación con bases de datos relacionales.

SQL son las siglas de Structured Query Language que significa lenguaje estructurado de consulta. Es soportado por todos los gestores de bases de datos relacionales que existen: MySQL, Postgresql, Oracle…

Este lenguaje está definido por el estándar ISO/ANSI\_SQL que usan para la gestión de las bases de datos los principales fabricantes de Sistemas de Gestión de Bases de Datos Relacionales.

Es un lenguaje no procedimental que se usa para definir, gestionar y manipular la información contenida en una Base de Datos Relacional.

Algunas características del lenguaje SQL son:

* Es un lenguaje de alto nivel: es decir, permite la abstracción de los archivos de las bases de datos
* Es un lenguaje declarativo: es decir, permite describir que se desea hacer, no las instrucciones para solucionarlo. Se centra en el qué, no en el cómo.
* Es un lenguaje orientado a manejar conjuntos de registros
* Tiene esquemas relacionales, ya que incluye sentencias para su definición
* Permite realizar consultas basadas en el álgebra relacional
* Incluye sentencias para restricciones de integridad que deben cumplir los datos
* Incluye sentencias para el control de transacciones
* Permite la interacción con otros lenguajes como C, Java, php...
* Incluye seguridad en los derechos de acceso

Según su finalidad, podemos clasificar los distintos tipos de sentencias SQL en varios sublenguajes:

### DDL (lenguage de definición de datos)

\
Permite definir la estructura con la que almacenaremos los datos, encargándose de la creación, modificación y eliminación de los objetos de la base de datos, además de la creación de las tablas. Es decir, crea o modifica la base de datos.

### DML (lenguaje de manipulación de datos)

Permite  añadir, modificar o eliminar datos, así como recuperar la información almacenada a través de consultas. Es decir, manipula la base de datos y realiza consultas

### &#x20;DCL (lenguaje de control de datos)

Sirve para controlar el acceso a la información y la seguridad de los datos creando o quitando privilegios de acceso a los datos. El encargado de usar el DCL es el administrador de la base de datos. Es decir, se encarga de los permisos, usuarios y la seguridad.

### TCL (lenguaje de control de transacciones)

Permite gestionar las transacciones, que son el conjunto de operaciones de manipulación de datos que se pueden validar o anular. Es decir, se encarga de controlar las transacciones.

### DQL(Lenguaje de consulta de datos)

Permite expresar búsqueda complejas dentro de una base de datos

<figure><img src="../.gitbook/assets/image (9).png" alt=""><figcaption><p>Tipos de sentencias SQL clasificadas por lenguaje al que pertenecen</p></figcaption></figure>

## Dialecto SQL

A pesar de ser un estándar, cada SGBD define ciertas peculiaridades en la forma en las que se expresan las sentencias en ese gestor. Al SQL de cada SGDB se le denomina dialecto SQL.
