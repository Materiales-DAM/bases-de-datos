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

# Foreign keys

Para la delcaración de claves foráneas seguiremos esta sintaxis en la parte de restricciones de tabla:

```sql
 | [CONSTRAINT [constraint_name]] 
        FOREIGN KEY (index_col_name, ...)
        REFERENCES another_table_name (index_col_name, ...)
        [ ON DELETE { RESTRICT | CASCADE | SET NULL | NO ACTION } ]
        [ ON UPDATE { RESTRICT | CASCADE | SET NULL | NO ACTION } ]
```

La convención será **fk\_{nombreTabla}\_{columnas}**

## Acciones referenciales

Es posible programar qué va a pasar con las filas de una tabla ante un determinado evento en la fila que referencia.

### ON DELETE

Define qué pasa con las filas cuando se elimina el registro al que referencian

* **RESTRICT**: no permite eliminar registros de la tabla relacionada si hay registros relacionados en la tabla actual
* **CASCADE**: elimina los registros relacionados al registro eliminado
* **SET NULL**: Establece a NULL las columnas de la FK cuando el registro relacionado se elimina.
* **NO ACTION**: Equivalente a RESTRICT

### ON UPDATE

Define qué pasa con las filas cuando se actualiza el registro con el que se relacionan:

* **RESTRICT**: no permite actualizar registros de la tabla relacionada si hay registros relacionados en la tabla actual
* **CASCADE**: actualiza los registros relacionados al registro modificado
* **SET NULL**: Establece a NULL las columnas de la FK cuando el registro relacionado se modifica.
* **NO ACTION**: Equivalente a RESTRICT

Por ejemplo, si quisiéramos crear esta base de datos

<figure><img src="../../../../.gitbook/assets/image (132).png" alt=""><figcaption></figcaption></figure>

Vamos a crear estas tablas con una FK que:

* No permita eliminar personas que son dueños de algún perro
* Si el DNI de una persona cambia, se actualiza en el perro del que son dueños.

```sql
CREATE DATABASE Perros;

USE Perros;

CREATE TABLE Persona(
    Dni VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL
);


CREATE TABLE Perro(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    DniDueño VARCHAR(10) NOT NULL,
    CONSTRAINT fk_Perro_Dueño
    FOREIGN KEY (DniDueño)
    REFERENCES Persona(Dni)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);
```
