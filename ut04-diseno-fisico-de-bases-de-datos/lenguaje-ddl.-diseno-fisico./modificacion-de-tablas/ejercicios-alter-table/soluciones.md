# Soluciones

1\.

```sql
USE Clases;

ALTER TABLE Alumno ADD COLUMN ZipCode INT NOT NULL;

ALTER TABLE Planta ADD COLUMN Nombre VARCHAR(20) NOT NULL;

ALTER TABLE Planta ADD UNIQUE INDEX idx_Planta_Nombre(Nombre);
```
