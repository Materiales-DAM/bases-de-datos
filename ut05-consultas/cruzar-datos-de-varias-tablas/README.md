---
cover: ../../.gitbook/assets/join.png
coverY: 297.31466666666665
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

# Cruzar datos de varias tablas

El cruce de datos entre varias tablas en una base de datos relacional es fundamental para extraer información significativa y completa de conjuntos de datos dispersos. Este proceso se realiza mediante operaciones, que combinan filas de dos o más tablas basándose en una condición especificada en la consulta.

Para poder cruzar datos entre tablas en una base de datos relacional, es necesario que existan relaciones entre las tablas (ya sean directas o indirectas). Estas relaciones se establecen a través de claves foráneas. Aquí hay algunos requisitos que deben cumplir las tablas para poder realizar operaciones de cruce de datos:

* Cada tabla debe tener una clave primaria que identifique de manera única cada fila en esa tabla.
* Alguna de las tablas tendrá una clave foránea que referencia a la otra tabla.
* La clave foránea debe tener el mismo tipo de datos que la clave primaria a la que hace referencia.

Por ejemplo, si tuviéramos esta base de datos:

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption><p>DIagrama de la base de datos Departamentos</p></figcaption></figure>



{% tabs %}
{% tab title="MySQL" %}
```sql
DROP DATABASE IF EXISTS Departamentos;

CREATE SCHEMA Departamentos;

USE Departamentos;

CREATE TABLE Departamento(
	Codigo VARCHAR(5) PRIMARY KEY,
	Presupuesto NUMERIC(10, 2) NOT NULL,
	Habitacion VARCHAR(3) NOT NULL
);

CREATE TABLE Ordenador(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Memoria INT NOT NULL,
	Procesador VARCHAR(20) NOT NULL,
	CodigoDepartamento VARCHAR(5) NOT NULL,
	CONSTRAINT fk_Ordenador_Departamento
	FOREIGN KEY (CodigoDepartamento)
	REFERENCES Departamento(Codigo)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE Profesor(
	Dni CHAR(9) PRIMARY KEY,
	Nombre VARCHAR(29) NOT NULL,
	Categoria CHAR(2) NOT NULL,
	Antiguedad INT NOT NULL,
	CodigoDepartamento VARCHAR(5) NULL,
	CONSTRAINT fk_Profesor_Departamento
	FOREIGN KEY (CodigoDepartamento)
	REFERENCES Departamento(Codigo)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
	
);

INSERT INTO Departamento(Codigo, Presupuesto, Habitacion) VALUES('INF', 10000, '101');

INSERT INTO Departamento(Codigo, Presupuesto, Habitacion) VALUES('MKT', 15000, '102');

INSERT INTO Departamento(Codigo, Presupuesto, Habitacion) VALUES('ADM', 1500, '103');

INSERT INTO Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(8, 'I5', 'INF');

INSERT INTO Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(16, 'I7', 'INF');

INSERT INTO Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(8, 'I5', 'MKT');

INSERT INTO Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(8, 'I5', 'MKT');

INSERT INTO Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000000X', 'Bob Esponja', 'JD', 15, 'INF');
INSERT INTO Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000001X', 'Calamardo', 'PS', 5, 'INF');
INSERT INTO Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000002X', 'George Pig', 'PT', 6, 'INF');

INSERT INTO Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000003X', 'Peppa Pig', 'JD', 15, 'MKT');
INSERT INTO Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000004X', 'Pocoyo', 'PS', 10, 'MKT');

-- Este profesor no tiene departamento
INSERT INTO Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000005X', 'Elly', 'PS', 5, null);

```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
DROP SCHEMA IF EXISTS Departamentos CASCADE;

CREATE SCHEMA Departamentos;

CREATE TABLE Departamentos.Departamento(
	Codigo VARCHAR(5) PRIMARY KEY,
	Presupuesto NUMERIC(10, 2) NOT NULL,
	Habitacion VARCHAR(3) NOT NULL
);

CREATE TABLE Departamentos.Ordenador(
	Id SERIAL PRIMARY KEY,
	Memoria INT NOT NULL,
	Procesador VARCHAR(20) NOT NULL,
	CodigoDepartamento VARCHAR(5) NOT NULL,
	CONSTRAINT fk_Ordenador_Departamento
	FOREIGN KEY (CodigoDepartamento)
	REFERENCES Departamentos.Departamento(Codigo)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE Departamentos.Profesor(
	Dni CHAR(9) PRIMARY KEY,
	Nombre VARCHAR(29) NOT NULL,
	Categoria CHAR(2) NOT NULL,
	Antiguedad INT NOT NULL,
	CodigoDepartamento VARCHAR(5) NULL,
	CONSTRAINT fk_Profesor_Departamento
	FOREIGN KEY (CodigoDepartamento)
	REFERENCES Departamentos.Departamento(Codigo)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
	
);

INSERT INTO Departamentos.Departamento(Codigo, Presupuesto, Habitacion) VALUES('INF', 10000, '101');

INSERT INTO Departamentos.Departamento(Codigo, Presupuesto, Habitacion) VALUES('MKT', 15000, '102');

INSERT INTO Departamentos.Departamento(Codigo, Presupuesto, Habitacion) VALUES('ADM', 1500, '103');

INSERT INTO Departamentos.Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(8, 'I5', 'INF');

INSERT INTO Departamentos.Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(16, 'I7', 'INF');

INSERT INTO Departamentos.Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(8, 'I5', 'MKT');

INSERT INTO Departamentos.Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(8, 'I5', 'MKT');

INSERT INTO Departamentos.Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000000X', 'Bob Esponja', 'JD', 15, 'INF');
INSERT INTO Departamentos.Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000001X', 'Calamardo', 'PS', 5, 'INF');
INSERT INTO Departamentos.Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000002X', 'George Pig', 'PT', 6, 'INF');

INSERT INTO Departamentos.Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000003X', 'Peppa Pig', 'JD', 15, 'MKT');
INSERT INTO Departamentos.Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000004X', 'Pocoyo', 'PS', 10, 'MKT');

-- Este profesor no tiene departamento
INSERT INTO Departamentos.Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) 
VALUES('00000005X', 'Elly', 'PS', 5, null);

```
{% endtab %}
{% endtabs %}

Podríamos querer cruzar los datos de varias maneras:

* Mostras los profesores con su departamento



```
Dni      |Nombre     |Categoria|Antiguedad|CodigoDepartamento|Codigo|Presupuesto|Habitacion|
---------+-----------+---------+----------+------------------+------+-----------+----------+
00000000X|Bob Esponja|JD       |        15|INF               |INF   |   10000.00|101       |
00000001X|Calamardo  |PS       |         5|INF               |INF   |   10000.00|101       |
00000002X|George Pig |PT       |         6|INF               |INF   |   10000.00|101       |
00000003X|Peppa Pig  |JD       |        15|MKT               |MKT   |   15000.00|102       |
00000004X|Pocoyo     |PS       |        10|MKT               |MKT   |   15000.00|102       |
00000005X|Elly       |PS       |         5|                  |      |           |          |
```

* Mostrar ordenadores con su departamento

```
Id|Memoria|Procesador|CodigoDepartamento|Codigo|Presupuesto|Habitacion|
--+-------+----------+------------------+------+-----------+----------+
 1|      8|I5        |INF               |INF   |   10000.00|101       |
 2|     16|I7        |INF               |INF   |   10000.00|101       |
 3|      8|I5        |MKT               |MKT   |   15000.00|102       |
 4|      8|I5        |MKT               |MKT   |   15000.00|102       |
```



Para conseguir esto, existen varias formas de cruzar tablas en una consulta SQL:

1. [Producto de tablas](producto-de-tablas/)
2. [Joins](joins/)
3. [Subqueries](../../ut06-agregaciones-subconsultas-optimizaciones/subqueries/)
