---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Soluciones INSERT INTO

Inserta los siguientes datos. MOdifica los script ddl

1.  Departamentos:\


    ```sql
    DROP DATABASE IF EXISTS Departamentos;

    CREATE DATABASE IF NOT EXISTS Departamentos;

    USE Departamentos;

    CREATE TABLE Departamento(
    	Codigo VARCHAR(3) PRIMARY KEY,
    	Presupuesto INT NOT NULL,
    	Habitacion INT NOT NULL
    );

    CREATE TABLE Profesor(
    	DNI VARCHAR(10) PRIMARY KEY,
    	Nombre VARCHAR(30) NOT NULL,
    	Categoria VARCHAR(30) NOT NULL,
    	Antiguedad INT NOT NULL,
    	Codigo_Departamento VARCHAR(3) NOT NULL,
    	CONSTRAINT fk_Departamento_Profesor
    	FOREIGN KEY (Codigo_Departamento)
    	REFERENCES Departamento(Codigo)
    	ON DELETE RESTRICT
    	ON UPDATE CASCADE
    );

    CREATE TABLE Ordenador(
    	Id INT PRIMARY KEY AUTO_INCREMENT,
    	Memoria VARCHAR(10) NOT NULL,
    	Procesador VARCHAR(30) NOT NULL,
    	Codigo_Departamento VARCHAR(3) NOT NULL,
    	CONSTRAINT fk_Departamento_Ordenador
    	FOREIGN KEY (Codigo_Departamento)
    	REFERENCES Departamento(Codigo)
    	ON DELETE RESTRICT
    	ON UPDATE CASCADE
    );

    /* Cambia el nombre de la columna Computer.Processor por Computer.ProcessorName */
    /* ALTER TABLE Ordenador RENAME COLUMN Procesador TO NombreProcesador; */
    /* Elimina la columna Budget de la tabla Department */
    /* ALTER TABLE Departamento DROP COLUMN Presupuesto; */

    /* ej. insert into (2024-12-11) */;
    INSERT INTO Departamento(Codigo, Presupuesto, Habitacion)
    VALUES 
    	('INF', 20000, 100),
    	('MKT', 25000, 101);

    INSERT INTO Profesor(DNI, Nombre, Categoria, Antiguedad, Codigo_Departamento)
    VALUES 
    	('00X', 'Bob Esponja', 'Jefe Departamento', 10,'INF'),
    	('01X', 'Pocoyo', 'Profesor Secundaria', 15,'INF'),
    	('0003X', 'Peppa Pig', 'Jefe Departamento', 20,'MKT');

    INSERT INTO Ordenador(Memoria, Procesador, Codigo_Departamento)
    VALUES 
    	('16GB', 'i7', 'INF'),
    	('16GB', 'i7', 'INF'),
    	('8GB', 'i3', 'MKT'); 
    ```
2.  Productos\


    ```sql
    ```
3.  Empresa

    ```sql
    ```

