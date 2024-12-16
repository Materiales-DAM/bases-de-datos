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
    DROP SCHEMA IF EXISTS Productos ;

    CREATE SCHEMA IF NOT EXISTS Productos;

    USE Productos;

    CREATE TABLE Producto (
    	Nombre VARCHAR(30) PRIMARY KEY,
    	Calorias INT NOT NULL,
    	Precio INT NOT NULL,
    	Tipo_Bolsa CHAR(1) NOT NULL

    );


    CREATE TABLE Provincia (
    	Codigo VARCHAR (9) PRIMARY KEY,
    	Nombre VARCHAR (30) NOT NULL,
    	Distancia INT NOT NULL
    	
    );


    CREATE TABLE Proveedor (
    	Nombre VARCHAR(30) PRIMARY KEY ,
    	Direccion VARCHAR (30) NOT NULL,
    	Telefono INT NOT NULL ,
    	Codigo_Provincia VARCHAR(9) NOT NULL,
    	CONSTRAINT fk_PROVEEDOR_PROVINCIA
    	FOREIGN KEY (Codigo_Provincia)
    	REFERENCES Provincia(Codigo)
    	ON DELETE RESTRICT
    	ON UPDATE CASCADE 

    );


    CREATE TABLE Ingrediente (
    	Codigo VARCHAR (10) PRIMARY KEY ,
    	Nombre VARCHAR (30) NOT NULL,
    	Precio INT NOT NULL,
    	Nombre_Proveedor VARCHAR(30) NOT NULL,
    	CONSTRAINT fk_INGREDIENTE_PROVEEDOR
    	FOREIGN KEY (Nombre_Proveedor)
    	REFERENCES Proveedor(Nombre)
    	ON DELETE RESTRICT
    	ON UPDATE CASCADE 

    );



    CREATE TABLE Producto_Contiene (
    	Nombre_Producto VARCHAR (30) NOT NULL,
    	Codigo_Ingrediente VARCHAR(30) NOT NULL,
    	PRIMARY KEY(Nombre_Producto,Codigo_Ingrediente),
    	CONSTRAINT fk_PRODUCTO_CONTIENE_PRODUCTO
    	FOREIGN KEY (Nombre_Producto)
    	REFERENCES Producto(Nombre)
    	ON DELETE CASCADE
    	ON UPDATE CASCADE,
    	CONSTRAINT fk_PRODUCTO_CONTIENE_INGREDIENTE
    	FOREIGN KEY (Codigo_Ingrediente)
    	REFERENCES Ingrediente(Codigo)
    	ON DELETE RESTRICT
    	ON UPDATE CASCADE

    ); 

    INSERT INTO Provincia (Codigo, Nombre, Distancia)
    Values('MAD', 'Madrid', 100),
          ('GUA', 'Guadalajara', 50);
         
    INSERT INTO Proveedor (Nombre, Direccion, Telefono, Codigo_Provincia)
    VALUES ('Carrefour','Calle falsa 3',600635636, 'MAD'),
           ('Almacenes Guadalajara', 'Calle Otra', 65656353, 'GUA');

    INSERT INTO Ingrediente (Codigo, Nombre, Precio,Nombre_Proveedor)
    VALUES ('1001', 'Arroz Largo', 2, 'Carrefour'),
           ('1002', 'Arroz bomba', 3, 'Carrefour'),
           ('1003', 'Conejo', 6, 'Almacenes Guadalajara'),
           ('1004', 'Verduras', 4, 'Almacenes Guadalajara');
          
    INSERT INTO Producto (Nombre, Calorias, Precio, Tipo_Bolsa)
     VALUES('Paella', 100, 20, 'L'),
           ('Arroz con Verduras', 50, 10, 'S');
    INSERT INTO Producto_Contiene (Nombre_Producto, Codigo_Ingrediente)
     VALUES ('Paella', '1002'),
            ('Paella', '1003'),
            ('Paella', '1004'),
            ('Arroz con verduras','1001'),
            ('Arroz con verduras','1004'); 
    ```
3.  Empresa

    ```sql
    ```

