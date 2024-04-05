# Soluciones

1\.

```sql
SELECT DISTINCT a.*
FROM
	alumno a 
	INNER JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_alumno 
	INNER JOIN asignatura asig ON asma.id_asignatura = asig.id 
	INNER JOIN grado g ON asig.id_grado = g.id 
WHERE g.nombre = 'Ingeniería Informática (Plan 2015)' AND a.sexo = 'M';
```

2\.

```sql
SELECT a.*
FROM 
	asignatura a
	INNER JOIN grado g ON g.id  = a.id_grado 
WHERE g.nombre = 'Ingeniería Informática (Plan 2015)';
```

3\.

```sql
SELECT p.apellido1 , p.apellido2 , p.nombre , d.nombre AS nombre_departamento
FROM
	profesor p 
	INNER JOIN departamento d ON p.id_departamento = d.id 
ORDER BY p.apellido1 , p.apellido2 , p.nombre ;
```

4\.

```sql
SELECT a.nombre, ce.anyo_inicio , ce.anyo_fin 
FROM
	asignatura a 
	INNER JOIN alumno_se_matricula_asignatura asma ON asma.id_asignatura = a.id 
	INNER JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar 
	INNER JOIN alumno al ON al.id = asma.id_alumno 
WHERE 
	al.nif  = '2X';
```

5\.

```sql
SELECT DISTINCT d.nombre
FROM
	departamento d 
	INNER JOIN profesor p ON d.id = p.id_departamento 
	INNER JOIN asignatura a ON a.id_profesor = p.id 
	INNER JOIN grado g ON a.id_grado = g.id 
WHERE
	g.nombre = 'Ingeniería Informática (Plan 2015)';
```

6\.

```sql
SELECT DISTINCT al.*
FROM
	alumno al
	INNER JOIN alumno_se_matricula_asignatura asma ON asma.id_alumno = al.id 
	INNER JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar 
WHERE
	ce.anyo_inicio = '2020' AND ce.anyo_fin = '2021';
```

7\.

```sql
SELECT d.nombre , p.apellido1 , p.apellido2 , p.nombre 
FROM
	profesor p 
	LEFT JOIN departamento d ON p.id_departamento = d.id 
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ;
```

8\.

```sql
SELECT p.* 
FROM 
	profesor p 
WHERE p.id_departamento IS NULL;

```

9\.

```sql
SELECT d.*
FROM 
	departamento d 
	LEFT JOIN profesor p ON d.id = p.id_departamento 
WHERE p.nombre IS NULL;
```

10.

```sql
SELECT p.*
FROM
	profesor p 
	LEFT JOIN asignatura a ON p.id = a.id_profesor 
WHERE a.id IS NULL;
```

11\.

```sql
SELECT a.*
FROM 
    asignatura a
WHERE a.id_profesor IS NULL;
```

12\.

```sql
SELECT d.nombre AS nombre_departamento, a.id as id_asignatura , a.nombre AS nombre_asignatura
FROM
	departamento d 
	INNER JOIN profesor p ON d.id = p.id_departamento 
	INNER JOIN asignatura a ON p.id = a.id_profesor 
	LEFT JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura 
WHERE asma.id_curso_escolar IS NULL;
```
