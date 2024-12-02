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

# Soluciones CREATE TABLE I

### MySQL

```sql
DROP DATABASE IF EXISTS Ej1;

CREATE DATABASE IF NOT EXISTS Ej1;

USE Ej1;

CREATE TABLE Profesor(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Dni VARCHAR(9) N,
	Nombre VARCHAR(20) NOT NULL,
	Categoria VARCHAR(20) NOT NULL,
	Antiguedad INT NOT NULL,
	CodigoDepartamento VARCHAR(5) NOT NULL
);

CREATE TABLE Ordenador(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Memoria INT DEFAULT 16 NOT NULL,
	Procesador VARCHAR(30) NOT NULL,
	CodigoDepartamento VARCHAR(5) DEFAULT 'MKT' NOT NULL
);

CREATE TABLE Departamento( 
	Codigo VARCHAR(5) PRIMARY KEY,
	Presupuesto INT NOT NULL,
	Habitacion VARCHAR(5) NOT NULL
);

CREATE TABLE Modulo(
    Titulo VARCHAR(10) NOT NULL,
    Curso INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(Titulo, Curso, Nombre)
);

```

### Postgres

```sql
DROP SCHEMA IF EXISTS Ej1 CASCADE;

CREATE SCHEMA IF NOT EXISTS Ej1;

CREATE TABLE Ej1.Profesor(
	Id SERIAL PRIMARY KEY,
	Dni VARCHAR(9) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Categoria VARCHAR(20) NOT NULL,
	Antiguedad INT NOT NULL,
	CodigoDepartamento VARCHAR(5) NOT NULL
);

CREATE TABLE Ej1.Ordenador(
	Id SERIAL PRIMARY KEY,
	Memoria INT DEFAULT 16 NOT NULL,
	Procesador VARCHAR(30) NOT NULL,
	CodigoDepartamento VARCHAR(5) DEFAULT 'MKT' NOT NULL
);

CREATE TABLE Ej1.Departamento( 
	Codigo VARCHAR(5) PRIMARY KEY,
	Presupuesto INT NOT NULL,
	Habitacion VARCHAR(5) NOT NULL
);

CREATE TABLE Ej1.Modulo(
    Titulo VARCHAR(10) NOT NULL,
    Curso INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(Titulo, Curso, Nombre)
);

```
