---
cover: ../../../.gitbook/assets/mysqlpost.jpeg
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

# Restricciones de columna

Son las restricciones que se aplican a cada columna en el momento de su definición:



```sql
    NombreColumna1 TipoDato [ NOT NULL ]
                            [ DEFAULT default_value ]
                            [ AUTO_INCREMENT ]
                            [ UNIQUE KEY | PRIMARY KEY ]
                            [ COMMENT 'comentario' ],
```

### **NOT NULL**

Define si la columna puede o no tomar valor NULL.

```sql
CREATE DATABASE Personas;

USE Personas;

CREATE TABLE Persona(
    Dni VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(30),
    Apellidos VARCHAR(50),
    Edad INT NOT NULL # La edad no puede ser null
);
```

Por defecto, una columna podrá tomar el valor null. Si no queremos permitirlo debemo añadir la claúsula NOT NULL

### **DEFAULT default\_value**:&#x20;

Valor por defecto de la columna, este valor se usará en inserciones que no especifiquen valor para la columna afectada.

```sql
CREATE DATABASE Personas;

USE Personas;

CREATE TABLE Persona(
    Dni VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(30),
    Apellidos VARCHAR(50),
    Edad INT NULL, # La edad puede ser null
    Pais VARCHAR(2) DEFAULT 'ES' # El país por defecto es ES
);
```

### **AUTO\_INCREMENT**

Permite crear una columna cuyo valor es un número que se incrementa en cada inserción, suele usarse en combinación con PRIMARY KEY

```sql
CREATE DATABASE Personas;

USE Personas;

CREATE TABLE Persona(
    PersonId INT AUTO_INCREMENT PRIMARY KEY,
    Dni VARCHAR(10),
    Nombre VARCHAR(30),
    Apellidos VARCHAR(50),
    Edad INT NULL # La edad puede ser null
);
```



**UNIQUE KEY | PRIMARY KEY**

Sirve para marcar una columna como clave única o clave primaria, dependiendo cuál se use.

```sql
CREATE TABLE Persona(
    PersonId INT AUTO_INCREMENT PRIMARY KEY,
    Dni VARCHAR(10) UNIQUE KEY,
    Nombre VARCHAR(30),
    Apellidos VARCHAR(50),
    Edad INT NULL # La edad puede ser null
);
```

**COMMENT 'comentario'**:&#x20;

Sirve para añadir un comentario informativo sobre la columna.

```sql
CREATE TABLE Persona(
    PersonId INT AUTO_INCREMENT PRIMARY KEY,
    Dni VARCHAR(10) UNIQUE KEY,
    Nombre VARCHAR(30),
    Apellidos VARCHAR(50) COMMENT 'Los dos primeros apellidos',
    Edad INT NULL # La edad puede ser null
);
```
