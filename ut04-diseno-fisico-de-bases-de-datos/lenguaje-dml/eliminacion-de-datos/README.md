---
cover: ../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Eliminación de datos

El comando `DELETE` en MySQL se emplea para eliminar filas de una tabla. La sintaxis es la siguiente:

```sql
DELETE FROM NombreDeLaTabla
WHERE Condicion;
```

A continuación, una explicación de los elementos clave:

* `NombreDeLaTabla`: Especifica el nombre de la tabla que se actualizará, en singular y en upper camel case.
* `Condicion`: Define la condición que determina qué filas se eliminarán. Si esta condición no se especifica, todas las filas de la tabla serán eliminadas.

Por ejemplo, supongamos que tenemos una tabla llamada `Employee`. Si queremos eliminar todos los empleados del departamento 'Ventas', podríamos utilizar el comando `DELETE` de la siguiente manera:

```sql
DELETE FROM Employee
WHERE Departament = 'Ventas';
```

Es importante ser precavido al usar el comando `DELETE`, asegurándote de tener una condición adecuada para afectar solo las filas deseadas y evitar eliminaciones no deseados en toda la tabla. Mantener una convención de nombres consistente mejora la legibilidad y mantenimiento del código.

### [Documentación oficial](https://dev.mysql.com/doc/refman/8.0/en/delete.html)

## Integridad referencial

En las bases de datos relacionales, la integridad referencial es crucial. Asegura que las relaciones entre las tablas se mantengan, evitando inconsistencias.

#### ON DELETE CASCADE

Considera dos tablas, "Employee" y "Project," con una relación de clave foránea:

<pre class="language-sql"><code class="lang-sql">CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50)  NOT NULL,
    EmployeeId INT  NOT NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(Id) ON DELETE CASCADE
);

<strong>-- Insertar empleados
</strong>INSERT INTO Employee (Id, Name)
VALUES (101, 'John Doe');

INSERT INTO Employee (Id, Name)
VALUES (102, 'Jane Smith');

-- Insertar proyectos
INSERT INTO Project (ProjectID, ProjectName, EmployeeId)
VALUES (1, 'Project A', 101);

INSERT INTO Project (ProjectID, ProjectName, EmployeeId)
VALUES (2, 'Project B', 102);

INSERT INTO Project (ProjectID, ProjectName, EmployeeId)
VALUES (3, 'Project C', 101);
</code></pre>

Ahora, si se elimina un empleado, todos los proyectos asociados también se eliminarán automáticamente debido a `ON DELETE CASCADE`.

```sql
-- Eliminar un empleado; los proyectos asociados se eliminarán automáticamente
DELETE FROM Employee
WHERE Id = 101;
```

En este ejemplo, al eliminar un empleado con Id 101, también se eliminarán todos los proyectos asociados con ese empleado de la tabla "Project."

#### ON DELETE RESTRICT

Modifiquemos la relación de clave foránea para usar `ON DELETE RESTRICT`:

<pre class="language-sql"><code class="lang-sql">CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50) NOT NULL,
    EmployeeId INT NOT NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(Id) ON DELETE RESTRICT
);

-- Insertar empleados
INSERT INTO Employee (Id, Name)
VALUES (101, 'John Doe');

INSERT INTO Employee (Id, Name)
VALUES (102, 'Jane Smith');

-- Insertar proyectos
INSERT INTO Project (ProjectID, ProjectName, EmployeeId)
VALUES (1, 'Project A', 101);
<strong>
</strong>INSERT INTO Project (ProjectID, ProjectName, EmployeeId)
VALUES (2, 'Project B', 102);

INSERT INTO Project (ProjectID, ProjectName, EmployeeId)
VALUES (3, 'Project C', 101);
</code></pre>

Con esta configuración no vamos a poder eliminar empleados que tengan proyectos relacionados, el ON DELETE RESTRICT provocará un fallo al tratar de eliminar un empelado con proyectos.

```sql

-- Intentar eliminar un empleado con proyectos asociados
-- Esto fallará debido a ON DELETE RESTRICT
DELETE FROM Employee
WHERE Id = 102;
```

En este caso, intentar eliminar un empleado con proyectos asociados fallará debido a la restricción `ON DELETE RESTRICT`. Primero debes eliminar los proyectos asociados o actualizar la clave foránea para proceder.

Para poder eliminar un empleado debemos eliminar previamente sus filas relacionadas

```sql
-- Eliminamos los proyectos del empleado 102
DELETE FROM Project
WHERE EmployeeId = 102;

-- Esto no fallará porque ya no hay filas relacionadas
DELETE FROM Employee
WHERE Id = 102;
```
