---
cover: ../.gitbook/assets/plsql.jpg
coverY: 0
---

# Introducción a PL/pgSQL

PL/pgSQL es un lenguaje procedural de código abierto basado en PL/SQL (Oracle) que se utiliza para escribir procedimientos almacenados y funciones en PostgreSQL. Aquí están algunas de las características principales de PL/pgSQL:

1. **Procedimientos almacenados y funciones**: Al igual que en PL/SQL, en PL/pgSQL puedes definir procedimientos almacenados y funciones que contienen lógica de programación para realizar tareas específicas dentro de la base de datos PostgreSQL. Los procedimientos almacenados se utilizan para realizar operaciones que no devuelven un valor, mientras que las funciones devuelven un valor.
2. **Variables y tipos de datos**: PL/pgSQL permite la declaración de variables y el uso de varios tipos de datos, incluyendo enteros, cadenas de texto, fechas, etc. También admite tipos de datos compuestos como registros y arreglos.
3. **Estructuras de control de flujo**: PL/pgSQL proporciona estructuras de control de flujo como `IF...THEN...ELSE`, `CASE`, `LOOP`, `WHILE`, entre otras, que te permiten controlar el flujo de ejecución de tus procedimientos almacenados y funciones.
4. **Manejo de excepciones**: Al igual que en PL/SQL, en PL/pgSQL puedes manejar excepciones utilizando bloques `BEGIN...END` y la cláusula `EXCEPTION`.
5. **Cursores**: PL/pgSQL admite el uso de cursores, que te permiten recorrer filas en un conjunto de resultados, similar a lo que se hace en PL/SQL.
6. **Transacciones**: PL/pgSQL te permite controlar transacciones dentro de tus procedimientos almacenados y funciones utilizando las instrucciones `BEGIN`, `COMMIT` y `ROLLBACK`.

En resumen, PL/pgSQL es una extensión de PostgreSQL que proporciona capacidades de programación procedural similares a PL/SQL de Oracle, lo que permite escribir código más complejo y funcionalidades avanzadas directamente dentro de la base de datos PostgreSQL. Esto puede ser útil para mejorar el rendimiento y la seguridad de las aplicaciones al reducir la cantidad de datos transferidos entre la base de datos y las aplicaciones externas.
