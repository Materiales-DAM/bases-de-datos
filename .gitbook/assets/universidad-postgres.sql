DROP SCHEMA IF EXISTS universidad CASCADE;
CREATE SCHEMA universidad;

 
CREATE TABLE universidad.departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE universidad.alumno (
    id SERIAL PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo CHAR(1)
);
 
CREATE TABLE universidad.profesor (
    id SERIAL PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES universidad.departamento(id)
);
 
 CREATE TABLE universidad.grado (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
 
CREATE TABLE universidad.asignatura (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos DECIMAL(6,2) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    curso INT NOT NULL,
    cuatrimestre INT NOT NULL,
    id_profesor INT,
    id_grado INT NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES universidad.profesor(id),
    FOREIGN KEY(id_grado) REFERENCES universidad.grado(id)
);
 
CREATE TABLE universidad.curso_escolar (
    id SERIAL PRIMARY KEY,
    anyo_inicio INT NOT NULL,
    anyo_fin INT NOT NULL
);

CREATE TABLE universidad.alumno_se_matricula_asignatura (
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_curso_escolar INT NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES universidad.alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES universidad.asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES universidad.curso_escolar(id)
);