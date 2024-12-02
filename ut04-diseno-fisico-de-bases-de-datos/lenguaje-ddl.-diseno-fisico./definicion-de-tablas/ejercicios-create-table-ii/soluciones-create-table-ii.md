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
```

### Postgres

```sql
```

## Productos

### Mysql

```sql
```

### Postgres

```sql
```

## Proyectos

### Mysql

```sql
```

### Postgres

```sql
```

## Libros

### Mysql

```sql
```

### Postgres

```sql
```

## Perros

### Mysql

```sql
```

### Postgres

```sql
```

## Empresa

### Mysql

```sql
```

### Postgres

```sql
```

