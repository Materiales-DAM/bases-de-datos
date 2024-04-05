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

# Restricciones de tabla

### Primary Key

Sirve para definir la clave primaria después de las columnas.

```sql
 [CONSTRAINT [constraint_name]] PRIMARY KEY [ USING BTREE | HASH ] (index_col_name, ...)
```

* La convención que usaremos para estas constraints es pk\_{nombreTabla}.
* Algoritmo: BTREE y HASH.

Ejemplo con clave primaria compuesta

```sql
CREATE TABLE Modulo(
    Titulo VARCHAR(10) NOT NULL,
    Curso INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(Titulo, Curso, Nombre)
);
```

### Índices

&#x20;Sirve para crear índices en columnas. Los índices se utilizan para optimizar consultas

```sql
 INDEX index_name [ USING BTREE | HASH ] (index_col_name, ...)
```

* La convención será idx\_{nombreTabla}\_{columnas}
* Algoritmo: BTREE y HASH.

Ejemplo

```sql
CREATE TABLE Modulo(
    Titulo VARCHAR(10) NOT NULL,
    Curso INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Aula INT NOT NULL,
    PRIMARY KEY(Titulo, Curso, Nombre),
    INDEX idx_Modulo_Aula(Aula)
);

```

### Unique Index

Sirve para establecer unas columnas cuya combinación de valores es única.

<pre class="language-sql"><code class="lang-sql"><strong>  [CONSTRAINT [constraint_name]] UNIQUE INDEX 
</strong>       [ USING BTREE | HASH ] (index_col_name, ...)
</code></pre>

* La convención será idx\_{nombreTabla}\_{columnas}
* Algoritmo: BTREE y HASH.

Ejemplo

```sql
CREATE TABLE Modulo(
    Titulo VARCHAR(10),
    Curso INT,
    Nombre VARCHAR(30),
    Aula INT,
    PRIMARY KEY(Titulo, Curso, Nombre),
    UNIQUE INDEX idx_Modulo_Aula(Aula)
);
```

### Checks

Permite realizar comprobaciones sobre los datos de la tabla. Por ejemplo, si queremos que la columna c1 sea siempre mayor que c3:

```sql
CREATE TABLE Modulo(
    Titulo VARCHAR(10) NOT NULL,
    Curso INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Aula INT NOT NULL,
    PRIMARY KEY(Titulo, Curso, Nombre),
    INDEX idx_Modulo_Aula(Aula),
    CHECK (Aula > 0)
);
```

