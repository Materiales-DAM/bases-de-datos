---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
layout:
  cover:
    visible: true
    size: full
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

# Soluciones joins universidad

1. ```sql
   SELECT DISTINCT a.*
   FROM alumno a 
   INNER JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_alumno 
   INNER JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id
   INNER JOIN asignatura asig ON asma.id_asignatura = asig.id
   INNER JOIN grado g ON asig.id_grado = g.id
   WHERE a.sexo = 'M' AND g.nombre = 'Ingeniería Informática (Plan 2015)' ; 
   ```
2. ```sql
   SELECT a.nombre 
   FROM asignatura a 
   INNER JOIN grado g ON a.id_grado = g.id 
   WHERE g.nombre = 'Ingeniería Informática (Plan 2015)'; 
   ```
3. ```sql
   SELECT pf.apellido1,pf.apellido2,pf.nombre, dp.nombre
   FROM profesor pf
   INNER JOIN departamento dp ON dp.id=pf.id_departamento
   ORDER BY pf.apellido1, pf.apellido2, pf.nombre; 
   ```
4. ```sql
   ```
5. ```
   ```
6. ```sql
   ```
7. ```sql
   ```
8. ```sql
   ```
9. ```sql
   ```
10. ```sql
    ```
11. ```sql
    ```
12. ```sql
    ```
