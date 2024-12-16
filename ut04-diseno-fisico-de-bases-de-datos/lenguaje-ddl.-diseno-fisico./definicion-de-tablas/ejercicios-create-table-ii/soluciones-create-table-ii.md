---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
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

# Soluciones CREATE TABLE II

Crea las siguientes bases de datos con código DDL

## Clases

### Mysql

```sql
DROP SCHEMA IF EXISTS Clases ;

CREATE SCHEMA IF NOT EXISTS Clases;

USE Clases;

CREATE TABLE Planta(
	Numero INT PRIMARY KEY
);

CREATE TABLE Modulo(
	Curso INT NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Turno CHAR(1) NOT NULL,
	Etapa CHAR(1) NOT NULL,
	Superficie INT NOT NULL,
	Numero_Planta INT NOT NULL,
	PRIMARY KEY(Curso, Titulo, Turno),
	CONSTRAINT fk_Modulo_Planta
	FOREIGN KEY (Numero_Planta)
	REFERENCES Planta(Numero)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Alumno(
	Dni VARCHAR(10) PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Apellidos VARCHAR(30) NOT NULL,
	Tiene_Carnet BOOL NOT NULL,
	Curso INT NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Turno CHAR(1) NOT NULL,
	CONSTRAINT fk_Alumno_Modulo
	FOREIGN KEY (Curso, Titulo, Turno)
	REFERENCES Modulo(Curso, Titulo, Turno)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);
```

### Postgres

```sql
DROP SCHEMA IF EXISTS Clases CASCADE ;

CREATE SCHEMA IF NOT EXISTS Clases;

CREATE TABLE Clases.Planta(
	Numero INT PRIMARY KEY
);

CREATE TABLE Clases.Modulo(
	Curso INT NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Turno CHAR(1) NOT NULL,
	Etapa CHAR(1) NOT NULL,
	Superficie INT NOT NULL,
	Numero_Planta INT NOT NULL,
	PRIMARY KEY(Curso, Titulo, Turno),
	CONSTRAINT fk_Modulo_Planta
	FOREIGN KEY (Numero_Planta)
	REFERENCES Clases.Planta(Numero)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Clases.Alumno(
	Dni VARCHAR(10) PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Apellidos VARCHAR(30) NOT NULL,
	Tiene_Carnet BOOL NOT NULL,
	Curso INT NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Turno CHAR(1) NOT NULL,
	CONSTRAINT fk_Alumno_Modulo
	FOREIGN KEY (Curso, Titulo, Turno)
	REFERENCES Clases.Modulo(Curso, Titulo, Turno)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);
```

## Departamentos

### Mysql

```sql
DROP DATABASE IF EXISTS Departamentos;

CREATE DATABASE IF NOT EXISTS Departamentos;

USE Departamentos;

CREATE TABLE Departamento(
	Codigo INT PRIMARY KEY ,
	Presupuesto INT NOT NULL ,
	Habitacion INT NOT NULL 
);

CREATE TABLE Profesor(
	Dni CHAR(9) PRIMARY KEY ,
	Nombre VARCHAR(20) NOT NULL ,
	Categoria VARCHAR(20) NOT NULL ,
	Antiguedad INT NOT NULL ,
	Cod_Departamento INT NOT NULL ,
	CONSTRAINT fk_Profesor_Departamento
	FOREIGN KEY (Cod_Departamento)
	REFERENCES Departamento(Codigo)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Ordenador(
	Id INT PRIMARY KEY ,
	Memoria INT NOT NULL ,
	Procesador VARCHAR(30),
	Cod_Departamento INT NOT NULL,
	CONSTRAINT fk_Ordenador_Departamento
	FOREIGN KEY (Cod_Departamento)
	REFERENCES Departamento(Codigo)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE 
); 	
```

### Postgres

```sql
DROP SCHEMA IF EXISTS Departamentos CASCADE ;

CREATE SCHEMA IF NOT EXISTS Departamentos;

CREATE TABLE Departamentos.Departamento(
	Codigo INT PRIMARY KEY ,
	Presupuesto INT NOT NULL ,
	Habitacion INT NOT NULL 
);

CREATE TABLE Departamentos.Profesor(
	Dni CHAR(9) PRIMARY KEY ,
	Nombre VARCHAR(20) NOT NULL ,
	Categoria VARCHAR(20) NOT NULL ,
	Antiguedad INT NOT NULL ,
	Cod_Departamento INT NOT NULL ,
	CONSTRAINT fk_Profesor_Departamento
	FOREIGN KEY (Cod_Departamento)
	REFERENCES Departamentos.Departamento(Codigo)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Departamentos.Ordenador(
	Id INT PRIMARY KEY ,
	Memoria INT NOT NULL ,
	Procesador VARCHAR(30),
	Cod_Departamento INT NOT NULL,
	CONSTRAINT fk_Ordenador_Departamento
	FOREIGN KEY (Cod_Departamento)
	REFERENCES Departamentos.Departamento(Codigo)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE 
); 
```

## Productos

### Mysql

```sql
DROP SCHEMA IF EXISTS Productos ;

CREATE SCHEMA IF NOT EXISTS Productos;

USE Productos;

CREATE TABLE Producto (
	Nombre VARCHAR(30) PRIMARY KEY,
	Calorias INT NOT NULL,
	Precio INT NOT NULL,
	Tipo_Bolsa CHAR (1) NOT NULL

);


CREATE TABLE Provincia (
	Codigo VARCHAR (10) PRIMARY KEY,
	Nombre VARCHAR (30) NOT NULL,
	Distancia INT NOT NULL
	
);


CREATE TABLE Proveedor (
	Nombre VARCHAR(30) PRIMARY KEY ,
	Direccion VARCHAR (30) NOT NULL,
	Telefono VARCHAR(9) NOT NULL ,
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
	PRECIO INT NOT NULL,
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
```

### Postgres

```sql
DROP SCHEMA IF EXISTS Productos CASCADE ;

CREATE SCHEMA IF NOT EXISTS Productos;

CREATE TABLE Productos.Producto (
	Nombre VARCHAR(30) PRIMARY KEY,
	Calorias INT NOT NULL,
	Precio INT NOT NULL,
	Tipo_Bolsa CHAR (1) NOT NULL

);


CREATE TABLE Productos.Provincia (
	Codigo VARCHAR (10) PRIMARY KEY,
	Nombre VARCHAR (30) NOT NULL,
	Distancia INT NOT NULL
	
);


CREATE TABLE Productos.Proveedor (
	Nombre VARCHAR(30) PRIMARY KEY ,
	Direccion VARCHAR (30) NOT NULL,
	Telefono VARCHAR(9) NOT NULL ,
	Codigo_Provincia VARCHAR(9) NOT NULL,
	CONSTRAINT fk_PROVEEDOR_PROVINCIA
	FOREIGN KEY (Codigo_Provincia)
	REFERENCES Productos.Provincia(Codigo)
	ON DELETE RESTRICT
	ON UPDATE CASCADE 

);


CREATE TABLE Productos.Ingrediente (
	Codigo VARCHAR (10) PRIMARY KEY ,
	Nombre VARCHAR (30) NOT NULL,
	PRECIO INT NOT NULL,
	Nombre_Proveedor VARCHAR(30) NOT NULL,
	CONSTRAINT fk_INGREDIENTE_PROVEEDOR
	FOREIGN KEY (Nombre_Proveedor)
	REFERENCES Productos.Proveedor(Nombre)
	ON DELETE RESTRICT
	ON UPDATE CASCADE 

);



CREATE TABLE Productos.Producto_Contiene (
	Nombre_Producto VARCHAR (30) NOT NULL,
	Codigo_Ingrediente VARCHAR(30) NOT NULL,
	PRIMARY KEY(Nombre_Producto,Codigo_Ingrediente),
	CONSTRAINT fk_PRODUCTO_CONTIENE_PRODUCTO
	FOREIGN KEY (Nombre_Producto)
	REFERENCES Productos.Producto(Nombre)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_PRODUCTO_CONTIENE_INGREDIENTE
	FOREIGN KEY (Codigo_Ingrediente)
	REFERENCES Productos.Ingrediente(Codigo)
	ON DELETE RESTRICT
	ON UPDATE CASCADE

); 
```

## Proyectos

### Mysql

```sql
DROP SCHEMA IF EXISTS Proyectos;

CREATE SCHEMA IF NOT EXISTS Proyectos;

USE Proyectos;

CREATE TABLE Empleado(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(30) NOT NULL,
	Apellidos VARCHAR(30) NOT NULL,
	Rol VARCHAR(10) NOT NULL
);

CREATE TABLE Proyecto(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(30) NOT NULL
);

CREATE TABLE Tarea(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(30) NOT NULL,
	Id_Empleado INT NOT NULL,
	Id_Proyecto INT NOT NULL,
	CONSTRAINT fk_Tarea_Empleado
	FOREIGN KEY (Id_Empleado)
	REFERENCES Empleado(Id)
	ON DELETE RESTRICT
    ON UPDATE CASCADE,
    CONSTRAINT fk_Tarea_Proyecto
	FOREIGN KEY (Id_Proyecto) 
	REFERENCES Proyecto(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
); 
```

### Postgres

```sql
DROP SCHEMA IF EXISTS Proyectos CASCADE;

CREATE SCHEMA IF NOT EXISTS Proyectos;

CREATE TABLE Proyectos.Empleado(
	Id SERIAL PRIMARY KEY ,
	Nombre VARCHAR(30) NOT NULL,
	Apellidos VARCHAR(30) NOT NULL,
	Rol VARCHAR(10) NOT NULL
);

CREATE TABLE Proyectos.Proyecto(
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL
);

CREATE TABLE Proyectos.Tarea(
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Id_Empleado INT NOT NULL,
	Id_Proyecto INT NOT NULL,
	CONSTRAINT fk_Tarea_Empleado
	FOREIGN KEY (Id_Empleado)
	REFERENCES Proyectos.Empleado(Id)
	ON DELETE RESTRICT
    ON UPDATE CASCADE,
    CONSTRAINT fk_Tarea_Proyecto
	FOREIGN KEY (Id_Proyecto) 
	REFERENCES Proyectos.Proyecto(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
); 
```

## Libros

### Mysql

```sql
DROP DATABASE IF EXISTS Libros;

CREATE DATABASE IF NOT EXISTS Libros;

USE Libros;

CREATE TABLE Autor(
	Nif VARCHAR(10) PRIMARY KEY,
	Nombre VARCHAR(20) NOT NULL,
	Apellidos VARCHAR(50) NOT NULL
);

CREATE TABLE Libro(
	Isbn VARCHAR(30) PRIMARY KEY,
	Titulo VARCHAR(50) NOT NULL,
	Genero VARCHAR(20) NOT NULL
);

CREATE TABLE Libro_Escrito_Por(
	Nif_Autor VARCHAR(10) NOT NULL,
	Isbn_Libro VARCHAR(30) NOT NULL,
	PRIMARY KEY (Nif_Autor, Isbn_Libro),
	
	CONSTRAINT fk_Libro_Escrito_Por_Autor
	FOREIGN KEY (Nif_Autor)
	REFERENCES Autor(Nif)
	ON DELETE RESTRICT
	ON UPDATE CASCADE,
	
	CONSTRAINT fk_Libro_Escrito_Por_Libro
	FOREIGN KEY (Isbn_Libro)
	REFERENCES Libro(Isbn)
	ON DELETE CASCADE
	ON UPDATE CASCADE
); 
```

### Postgres

```sql
DROP SCHEMA IF EXISTS Libros CASCADE;

CREATE SCHEMA IF NOT EXISTS Libros;


CREATE TABLE Libros.Autor(
	Nif VARCHAR(10) PRIMARY KEY,
	Nombre VARCHAR(20) NOT NULL,
	Apellidos VARCHAR(50) NOT NULL
);

CREATE TABLE Libros.Libro(
	Isbn VARCHAR(30) PRIMARY KEY,
	Titulo VARCHAR(50) NOT NULL,
	Genero VARCHAR(20) NOT NULL
);

CREATE TABLE Libros.Libro_Escrito_Por(
	Nif_Autor VARCHAR(10) NOT NULL,
	Isbn_Libro VARCHAR(30) NOT NULL,
	PRIMARY KEY (Nif_Autor, Isbn_Libro),
	
	CONSTRAINT fk_Libro_Escrito_Por_Autor
	FOREIGN KEY (Nif_Autor)
	REFERENCES Libros.Autor(Nif)
	ON DELETE RESTRICT
	ON UPDATE CASCADE,
	
	CONSTRAINT fk_Libro_Escrito_Por_Libro
	FOREIGN KEY (Isbn_Libro)
	REFERENCES Libros.Libro(Isbn)
	ON DELETE CASCADE
	ON UPDATE CASCADE
); 
```

## Perros I

### Mysql

```sql
DROP DATABASE IF EXISTS Ej5II;

CREATE DATABASE IF NOT EXISTS Ej5II;

USE Ej5II;

CREATE TABLE Persona (
    Dni VARCHAR PRIMARY KEY,
    Nombre VARCHAR (20) NOT NULL,
    Apellidos VARCHAR (20) NOT NULL
);

CREATE TABLE Perro (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR (20) NOT NULL,
    Dni_Persona VARCHAR NOT NULL,
    CONSTRAINT fk_Perro_Persona
    FOREIGN KEY (Dni_Persona)
    REFERENCES Persona (Dni)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
); 
```

### Postgres

```sql
DROP SCHEMA IF EXISTS Ej5II CASCADE;

CREATE SCHEMA IF NOT EXISTS Ej5II;

CREATE TABLE Ej5II.Persona (
    Dni VARCHAR PRIMARY KEY,
    Nombre VARCHAR (20) NOT NULL,
    Apellidos VARCHAR (20) NOT NULL
);

CREATE TABLE Ej5II.Perro (
    Id SERIAL PRIMARY KEY,
    Nombre VARCHAR (20) NOT NULL,
    Dni_Persona VARCHAR NOT NULL,
    CONSTRAINT fk_Perro_Persona
    FOREIGN KEY (Dni_Persona)
    REFERENCES Ej5II.Persona (Dni)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
); 
```

## Perros II

### Mysql

```sql
DROP DATABASE IF EXISTS EJ2_Perros_2;

CREATE DATABASE IF NOT EXISTS EJ2_Perros_2;

USE EJ2_Perros_2;

CREATE TABLE Persona(
	dni VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellidos VARCHAR(30) NOT NULL
);

CREATE TABLE Perro(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	nombre VARCHAR(20) NOT NULL
);

CREATE TABLE Adopcion(
	dni_persona VARCHAR(9) NOT NULL, 
	id_perro INT NOT NULL,
	PRIMARY KEY(dni_persona, id_perro), 
	CONSTRAINT FK_PERSONA_ADOPCION
	FOREIGN KEY (dni_persona) REFERENCES Persona(dni)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE, 
	CONSTRAINT FK_PERRO_ADOPCION
	FOREIGN KEY (id_perro) REFERENCES Perro(id)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
); 
```

### Postgres

```sql
DROP SCHEMA IF EXISTS EJ2_Perros_2 CASCADE;

CREATE SCHEMA IF NOT EXISTS EJ2_Perros_2;

CREATE TABLE EJ2_Perros_2.Persona(
	dni VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellidos VARCHAR(30) NOT NULL
);

CREATE TABLE EJ2_Perros_2.Perro(
	id SERIAL PRIMARY KEY, 
	nombre VARCHAR(20) NOT NULL
);

CREATE TABLE EJ2_Perros_2.Adopcion(
	dni_persona VARCHAR(9) NOT NULL, 
	id_perro INT NOT NULL,
	PRIMARY KEY(dni_persona, id_perro), 
	CONSTRAINT FK_PERSONA_ADOPCION
	FOREIGN KEY (dni_persona) REFERENCES EJ2_Perros_2.Persona(dni)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE, 
	CONSTRAINT FK_PERRO_ADOPCION
	FOREIGN KEY (id_perro) REFERENCES EJ2_Perros_2.Perro(id)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
); 
```

## Perros III

### Mysql

```sql
DROP DATABASE IF EXISTS ej7_3;

CREATE DATABASE IF NOT EXISTS ej7_3;

USE ej7_3;

CREATE TABLE Persona(
	dni VARCHAR(10) PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Apeliidos VARCHAR(50) NOT NULL
);

CREATE TABLE Perro(
	id INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(30) NOT NULL,
	dni_dueño VARCHAR(10) NOT NULL UNIQUE,
	CONSTRAINT fk_Perro_Persona
	FOREIGN KEY (dni_dueño)
	REFERENCES Persona(dni)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
); 
```

### Postgres

```sql
DROP SCHEMA IF EXISTS ej7_3 CASCADE;

CREATE SCHEMA IF NOT EXISTS ej7_3;

CREATE TABLE ej7_3.Persona(
	dni VARCHAR(10) PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Apeliidos VARCHAR(50) NOT NULL
);

CREATE TABLE ej7_3.Perro(
	id SERIAL PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	dni_dueño VARCHAR(10) NOT NULL UNIQUE,
	CONSTRAINT fk_Perro_Persona
	FOREIGN KEY (dni_dueño)
	REFERENCES ej7_3.Persona(dni)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
); 
```

## Perros IV

### Mysql

```sql
DROP SCHEMA IF EXISTS Perros;

CREATE SCHEMA IF NOT EXISTS Perros;
USE Perros;

CREATE TABLE Perro(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL
);

CREATE TABLE Persona(
    DNI VARCHAR(9) PRIMARY KEY ,
    Nombre VARCHAR(30) NOT NULL ,
    Apellidos VARCHAR(30) NOT NULL,
    ID_Perro INT NOT NULL,
    CONSTRAINT fk_Perro_Persona
    FOREIGN KEY (ID_Perro)
    REFERENCES Perro(ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE 
); 
```

### Postgres

```sql
DROP SCHEMA IF EXISTS Perros CASCADE;

CREATE SCHEMA IF NOT EXISTS Perros;

CREATE TABLE Perros.Perro(
    ID SERIAL PRIMARY KEY ,
    Nombre VARCHAR(30) NOT NULL
);

CREATE TABLE Perros.Persona(
    DNI VARCHAR(9) PRIMARY KEY ,
    Nombre VARCHAR(30) NOT NULL ,
    Apellidos VARCHAR(30) NOT NULL,
    ID_Perro INT NOT NULL,
    CONSTRAINT fk_Perro_Persona
    FOREIGN KEY (ID_Perro)
    REFERENCES Perros.Perro(ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE 
); 
```

## Empresa

### Mysql

```sql
DROP DATABASE IF EXISTS ej8;

CREATE DATABASE IF NOT EXISTS ej8;

USE ej8;

CREATE TABLE Departamento(
	Nombre VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Chofer(
	NumEmpleado INT PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Direccion VARCHAR(30) NOT NULL,
	NumLibreta INT NOT NULL,
	NumAccidente INT NOT NULL,
	NomDep VARCHAR(30) NOT NULL,
	CONSTRAINT fk_Chofer_Departamento
	FOREIGN KEY (NomDep)
	REFERENCES Departamento(Nombre)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Administrativo(
	NumEmpleado INT PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Direccion VARCHAR(30) NOT NULL,
	NumDep VARCHAR(30) NOT NULL,
	CONSTRAINT fk_Administrativo_Departamento
	FOREIGN KEY (NumDep)
	REFERENCES Departamento(Nombre)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE IdiomaAdmin(
	NumEmpleado INT PRIMARY KEY,
	Idioma VARCHAR(30),
	CONSTRAINT fk_IdiomaAdmin_Administrativo
	FOREIGN KEY (NumEmpleado)
	REFERENCES Administrativo(NumEmpleado)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Coche(
	Matricula VARCHAR(30) PRIMARY KEY,
	Marca VARCHAR(30) NOT NULL
);

CREATE TABLE ChoferConduceCoche(
	idChofer INT NOT NULL,
	Matricula VARCHAR(30) NOT NULL,
	Fecha DATE NOT NULL,
	PRIMARY KEY(idChofer, Matricula, Fecha),
	CONSTRAINT fk_ChoferConduceCoche_Chofer
	FOREIGN KEY (idChofer)
	REFERENCES Chofer(NumEmpleado)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE,
	CONSTRAINT fk_ChoferConduceCoche_Coche
	FOREIGN KEY (Matricula)
	REFERENCES Coche(Matricula)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);



CREATE TABLE Tecnico(
	NumEmpleado INT PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Direccion VARCHAR(30) NOT NULL,
	NomDep VARCHAR(30) NOT NULL,
	CONSTRAINT fk_Tecnico_Departamento
	FOREIGN KEY (NomDep)
	REFERENCES Departamento(Nombre)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE EspecialidadTecnico(
	NumEmpleado INT NOT NULL,
	Especialidad INT NOT NULL,
	PRIMARY KEY(NumEmpleado, Especialidad),
	CONSTRAINT fk_EspecialidadTecnico_Tecnico
	FOREIGN KEY (NumEmpleado)
	REFERENCES Tecnico(NumEmpleado)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
); 
```

### Postgres

```sql
DROP SCHEMA IF EXISTS ej8 CASCADE;

CREATE SCHEMA IF NOT EXISTS ej8;

CREATE TABLE ej8.Departamento(
	Nombre VARCHAR(30) PRIMARY KEY
);

CREATE TABLE ej8.Chofer(
	NumEmpleado INT PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Direccion VARCHAR(30) NOT NULL,
	NumLibreta INT NOT NULL,
	NumAccidente INT NOT NULL,
	NomDep VARCHAR(30) NOT NULL,
	CONSTRAINT fk_Chofer_Departamento
	FOREIGN KEY (NomDep)
	REFERENCES ej8.Departamento(Nombre)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE ej8.Administrativo(
	NumEmpleado INT PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Direccion VARCHAR(30) NOT NULL,
	NumDep VARCHAR(30) NOT NULL,
	CONSTRAINT fk_Administrativo_Departamento
	FOREIGN KEY (NumDep)
	REFERENCES ej8.Departamento(Nombre)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE ej8.IdiomaAdmin(
	NumEmpleado INT PRIMARY KEY,
	Idioma VARCHAR(30),
	CONSTRAINT fk_IdiomaAdmin_Administrativo
	FOREIGN KEY (NumEmpleado)
	REFERENCES ej8.Administrativo(NumEmpleado)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE ej8.Coche(
	Matricula VARCHAR(30) PRIMARY KEY,
	Marca VARCHAR(30) NOT NULL
);

CREATE TABLE ej8.ChoferConduceCoche(
	idChofer INT NOT NULL,
	Matricula VARCHAR(30) NOT NULL,
	Fecha DATE NOT NULL,
	PRIMARY KEY(idChofer, Matricula, Fecha),
	CONSTRAINT fk_ChoferConduceCoche_Chofer
	FOREIGN KEY (idChofer)
	REFERENCES ej8.Chofer(NumEmpleado)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE,
	CONSTRAINT fk_ChoferConduceCoche_Coche
	FOREIGN KEY (Matricula)
	REFERENCES ej8.Coche(Matricula)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);



CREATE TABLE ej8.Tecnico(
	NumEmpleado INT PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Direccion VARCHAR(30) NOT NULL,
	NomDep VARCHAR(30) NOT NULL,
	CONSTRAINT fk_Tecnico_Departamento
	FOREIGN KEY (NomDep)
	REFERENCES ej8.Departamento(Nombre)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE EspecialidadTecnico(
	NumEmpleado INT NOT NULL,
	Especialidad VARCHAR(50) NOT NULL,
	PRIMARY KEY(NumEmpleado, Especialidad),
	CONSTRAINT fk_EspecialidadTecnico_Tecnico
	FOREIGN KEY (NumEmpleado)
	REFERENCES ej8.Tecnico(NumEmpleado)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
); 
```

