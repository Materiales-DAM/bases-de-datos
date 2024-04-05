DROP DATABASE IF EXISTS universidad;
CREATE DATABASE universidad CHARACTER SET utf8mb4;
USE universidad;
 
CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE alumno (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M', 'O') NOT NULL
);
 
CREATE TABLE profesor (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M', 'O') NOT NULL,
    id_departamento INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
 
 CREATE TABLE grado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
 
CREATE TABLE asignatura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT UNSIGNED NOT NULL,
    tipo ENUM('básica', 'obligatoria', 'optativa') NOT NULL,
    curso TINYINT UNSIGNED NOT NULL,
    cuatrimestre TINYINT UNSIGNED NOT NULL,
    id_profesor INT UNSIGNED,
    id_grado INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);
 
CREATE TABLE curso_escolar (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    anyo_inicio YEAR NOT NULL,
    anyo_fin YEAR NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT UNSIGNED NOT NULL,
    id_asignatura INT UNSIGNED NOT NULL,
    id_curso_escolar INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);


INSERT INTO departamento(nombre)
    VALUES 
        ('Informática'),
        ('Matemáticas'),
        ('Filosofía'),
        ('Derecho'),
        ('Telecomunicaciones');
    
INSERT INTO alumno(nif, nombre, apellido1, direccion, ciudad, telefono, fecha_nacimiento, sexo)
    VALUES
        ('1X', 'Bob', 'Esponja', 'Calle Escuadra', 'Madrid', '600', '2000-01-13', 'H'),
        ('2X', 'Peppa', 'Pig', 'Calle Esgrima', 'Madrid', '6001', '2006-01-13', 'M'),
        ('3X', 'George', 'Pig', 'Calle Esgrima', 'Madrid', '6002', '2009-01-13', 'H'),
        ('4X', 'Elly', 'Pocoyo', 'Calle Laurel', 'Madrid', '6003', '2001-01-13', 'O');
    
INSERT INTO profesor(nif, nombre, apellido1, direccion, ciudad, telefono, fecha_nacimiento, sexo, id_departamento)
    VALUES
        ('10X', 'Clark', 'Kent', 'Calle Olivar', 'Madrid', '600001', '1980-01-13', 'H', 1),
        ('11X', 'Mary Jane', 'Watson', 'Calle Olmo', 'Madrid', '600002', '1980-01-13', 'M', 1),
        ('12X', 'Peter', 'Parker', 'Gran Vía', 'Madrid', '600003', '1982-01-13', 'H', 2),
        ('13X', 'Son', 'Goku', 'Calle Tribulete', 'Madrid', '600004', '1984-01-13', 'H', 2),
        ('14X', 'Paca', 'Sánchez', 'Calle Riber de Curtidores', 'Madrid', '600005', '1985-01-13', 'H', 3);
    
INSERT INTO grado(nombre)
    VALUES 
        ('Grado de Filosofía de la Ciencia'),
        ('Grado de Historia de la Filosofía'),
        ('Grado de Informática de Sistemas'),
        ('Grado de Informática de Gestión'),
        ('Ingeniería Informática (Plan 2015)'),
        ('Grado de Telecomunicaciones');
    
INSERT INTO asignatura(nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado)
    VALUES
        ('Programación', 6, 'obligatoria', 1,1, 1,5),
        ('Bases de datos',5, 'obligatoria', 1,2, 2,5),
        ('Programación', 6, 'obligatoria', 1,1, 1,3),
        ('Bases de datos',5, 'obligatoria', 1,2, 2,3),
        ('Programación', 6, 'obligatoria', 1,1, 1,4),
        ('Bases de datos',5, 'obligatoria', 1,2, 2,4),
        ('Filosofía clásica', 5, 'optativa', 2, 1, 5,1);
    
INSERT INTO curso_escolar(anyo_inicio, anyo_fin)
    VALUES
        (2020, 2021),
        (2021, 2022),
        (2022, 2023);
    
INSERT INTO alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar)
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