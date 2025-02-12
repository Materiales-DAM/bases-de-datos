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
   SELECT DISTINCT asig.nombre, ce.anyo_inicio, ce.anyo_fin
   FROM alumno a
   INNER JOIN alumno_se_matricula_asignatura asma ON asma.id_alumno = a.id
   INNER JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar
   JOIN asignatura asig ON asig.id = asma.id_asignatura
   WHERE a.nif = '2X'; 
   ```
5. ```sql
   SELECT DISTINCT d.*
   FROM departamento d 
   INNER JOIN profesor p ON d.id= p.id_departamento
   INNER JOIN asignatura a ON p.id = a.id_profesor
   INNER JOIN grado g ON g.id = a.id_grado
   WHERE g.nombre = 'Ingeniería Informática (Plan 2015)' 
   ```
6. ```sql
   SELECT DISTINCT a.*
   FROM alumno a 
   INNER JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_alumno
   INNER JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id
   WHERE ce.anyo_inicio = 2020 AND ce.anyo_fin = 2021; 
   ```
7. ```sql
   SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento
   FROM profesor p
   LEFT JOIN departamento d ON p.id_departamento = d.id
   ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre; 
   ```
8. ```sql
   SELECT p.* 
   FROM profesor p 
   LEFT JOIN departamento d ON p.id_departamento = d.id
   WHERE d.nombre IS NULL; 
   ```
9. ```sql
   SELECT d.*
   FROM departamento d 
   LEFT JOIN profesor p ON d.id = p.id_departamento 
   WHERE p.id IS NULL ; 
   ```
10. ```sql
    ```
11. ```sql
    ```
12. ```sql
    ```
