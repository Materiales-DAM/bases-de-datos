---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Soluciones ALTER TABLE

1. Modifica la base de datos Clases:
   1.  Añade una columna ZipCode de tipo entero a la tabla Alumno\


       ALTER TABLE Alumno ADD COLUMN CodigoPostal INT NOT NULL;
   2. Añade una columna Nombre a la tabla Planta\
      `ALTER TABLE Planta ADD COLUMN Nombre VARCHAR(30) NOT NULL;`
   3. Añade un UNIQUE INDEX en Nombre de la tabla Planta\
      `ALTER TABLE Planta ADD UNIQUE INDEX idx_Planta_Nombre(Nombre);`
2. &#x20;Modifica la base de datos Departamentos:
   1. Cambia el nombre de la columna Computer.Processor por Computer.ProcessorName\
      ALTER TABLE Ordenador RENAME COLUMN Procesador TO `ProcesadorNombre`;
   2. Elimina la columna Budget de la tabla Department\
      `ALTER TABLE Departamento DROP COLUMN Presupuesto;`
