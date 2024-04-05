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

INSERT INTO universidad.departamento(nombre)
    VALUES 
        ('Informática'),
        ('Matemáticas'),
        ('Filosofía'),
        ('Derecho'),
        ('Telecomunicaciones');
    
INSERT INTO universidad.alumno(nif, nombre, apellido1, direccion, ciudad, telefono, fecha_nacimiento, sexo)
    VALUES
        ('1X', 'Bob', 'Esponja', 'Calle Escuadra', 'Madrid', '600', '2000-01-13', 'H'),
        ('2X', 'Peppa', 'Pig', 'Calle Esgrima', 'Madrid', '6001', '2006-01-13', 'M'),
        ('3X', 'George', 'Pig', 'Calle Esgrima', 'Madrid', '6002', '2009-01-13', 'H'),
        ('4X', 'Elly', 'Pocoyo', 'Calle Laurel', 'Madrid', '6003', '2001-01-13', 'O');
    
INSERT INTO universidad.profesor(nif, nombre, apellido1, direccion, ciudad, telefono, fecha_nacimiento, sexo, id_departamento)
    VALUES
        ('10X', 'Clark', 'Kent', 'Calle Olivar', 'Madrid', '600001', '1980-01-13', 'H', 1),
        ('11X', 'Mary Jane', 'Watson', 'Calle Olmo', 'Madrid', '600002', '1980-01-13', 'M', 1),
        ('12X', 'Peter', 'Parker', 'Gran Vía', 'Madrid', '600003', '1982-01-13', 'H', 2),
        ('13X', 'Son', 'Goku', 'Calle Tribulete', 'Madrid', '600004', '1984-01-13', 'H', 2),
        ('14X', 'Paca', 'Sánchez', 'Calle Riber de Curtidores', 'Madrid', '600005', '1985-01-13', 'H', 3);
    
INSERT INTO universidad.grado(nombre)
    VALUES 
        ('Grado de Filosofía de la Ciencia'),
        ('Grado de Historia de la Filosofía'),
        ('Grado de Informática de Sistemas'),
        ('Grado de Informática de Gestión'),
        ('Ingeniería Informática (Plan 2015)'),
        ('Grado de Telecomunicaciones');
    
INSERT INTO universidad.asignatura(nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado)
    VALUES
        ('Programación', 6, 'obligatoria', 1,1, 1,5),
        ('Bases de datos',5, 'obligatoria', 1,2, 2,5),
        ('Programación', 6, 'obligatoria', 1,1, 1,3),
        ('Bases de datos',5, 'obligatoria', 1,2, 2,3),
        ('Programación', 6, 'obligatoria', 1,1, 1,4),
        ('Bases de datos',5, 'obligatoria', 1,2, 2,4),
        ('Filosofía clásica', 5, 'optativa', 2, 1, 5,1);
    
INSERT INTO universidad.curso_escolar(anyo_inicio, anyo_fin)
    VALUES
        (2020, 2021),
        (2021, 2022),
        (2022, 2023);
    
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar)
    VALUES
        (1, 1, 1),
        (1, 2, 1),
        (1, 1, 2),
        (1, 2, 2),
        (1, 1, 3),
        (2, 1, 2),
        (2, 2, 2),
        (2, 1, 3),
        (3, 1, 1),
        (3, 2, 1),
        (3, 1, 2),
        (3, 1, 3);
